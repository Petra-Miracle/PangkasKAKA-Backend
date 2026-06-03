import barberRepository from '../repositories/barberRepository.js';

class BarberService {
  extractDistrict(address) {
    if (!address || address === '-' || address.trim() === '') return null;
    const districts = ['Oebobo', 'Maulafa', 'Kelapa Lima', 'Kota Lama', 'Kota Raja', 'Oebufu', 'Oesapa', 'Liliba', 'Penfui', 'Naioni', 'Bakunase', 'Fatululi', 'Namosain', 'Pasir Panjang', 'KF. Bunge', 'Bello', 'Merdeka', 'Mantasi', 'Benu', 'Airmata', 'Lai-Lai', 'Besi Pahit', 'Bonipoi', 'Solor'];
    const upperAddress = address.toUpperCase();
    for (const d of districts) {
      if (upperAddress.includes(d.toUpperCase())) return d;
    }
    if (upperAddress.includes('JL. W.J. LALAMENTIK') || upperAddress.includes('JL. W.J.LALAMENTIK')) return 'Oebobo';
    if (upperAddress.includes('JL. TIMOR RAYA') || upperAddress.includes('JL. TDM')) return 'Kelapa Lima';
    if (upperAddress.includes('JL. PERINTIS KEMERDEKAAN')) return 'Kelapa Lima';
    if (upperAddress.includes('JL. PAHLAWAN')) return 'Kota Lama';
    if (upperAddress.includes('JL. FARMASI')) return 'Oebobo';
    if (upperAddress.includes('JL. SUMATERA') || upperAddress.includes('JL. SAMRATULANGI')) return 'Oebobo';
    if (upperAddress.includes('JL. JEND. SOEHARTO') || upperAddress.includes('JL. JENDERAL SUDIRMAN') || upperAddress.includes('JL. JEND. SUDIRMAN')) return 'Kota Raja';
    return null;
  }

  getDefaultImages() {
    return [
      'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1585747860715-2ba37e788b70?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1621605815841-28d944683b83?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1593702295094-ada74bc4a39d?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1567894340315-735d7c361db7?q=80&w=500&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1599351431202-1e0f5e07b795?q=80&w=500&auto=format&fit=crop',
    ];
  }

  transformShop(shop, index) {
    const images = this.getDefaultImages();
    const prices = shop.services?.map(s => parseFloat(s.price)).filter(p => !isNaN(p)) || [];
    const minPrice = prices.length > 0 ? Math.min(...prices) : null;

    const district = this.extractDistrict(shop.address) || shop.category || 'Kupang';

    return {
      id: shop.id,
      name: shop.name,
      address: shop.address,
      rating: shop.rating ? parseFloat(shop.rating) : 4.5,
      image: shop.image || images[index % images.length],
      price: minPrice ? `Rp ${minPrice.toLocaleString('id-ID')}` : 'Rp 35.000',
      distance: '1,2 km',
      district,
      category: shop.category || 'Barbershop',
      operationalStatus: shop.operationalStatus,
      isVerified: shop.isVerified || false,
      reviewsCount: shop.reviewsCount || 0,
    };
  }

  // Haversine Formula to calculate distance between two points in km
  calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371;
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLon = (lon2 - lon1) * (Math.PI / 180);
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
      Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }

  async getNearbyBarbers(userLat, userLng) {
    const allShops = await barberRepository.getAllBarbershops();

    if (!userLat || !userLng) {
      return allShops.map((shop, index) => this.transformShop(shop, index));
    }

    const shopsWithDistance = allShops
      .filter(shop => shop.latitude && shop.longitude)
      .map(shop => {
        const distance = this.calculateDistance(
          userLat,
          userLng,
          parseFloat(shop.latitude),
          parseFloat(shop.longitude)
        );
        return {
          ...this.transformShop(shop),
          distance: parseFloat(distance.toFixed(2))
        };
      });

    if (shopsWithDistance.length === 0) {
      return allShops.map((shop, index) => this.transformShop(shop, index));
    }

    return shopsWithDistance.sort((a, b) => a.distance - b.distance);
  }
}

export default new BarberService();
