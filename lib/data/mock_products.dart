import '../models/product.dart';

const double surplusPricePerKg = 899;

final List<String> categories = [
  'All',
  'Dresses',
  'Maxi',
  'Midi',
  'Casual',
  'Party',
  'Floral',
];

final List<Product> products = [
  const Product(
    id: '1',
    name: 'Floral Midi Dress',
    category: 'Midi',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.45,
    size: 'M',
    color: 'Cream Floral',
    imageUrl:
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=600&q=80',
    description:
        'Elegant midi dress with delicate floral print in warm earthy tones. Perfect for everyday elegance.',
    isNew: true,
    isFeatured: true,
  ),
  const Product(
    id: '2',
    name: 'Terracotta Maxi',
    category: 'Maxi',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.62,
    size: 'L',
    color: 'Burnt Orange',
    imageUrl:
        'https://images.unsplash.com/photo-1572804013309-59a88b7e92d1?w=600&q=80',
    description:
        'Flowing maxi dress in rich terracotta shade. Lightweight and graceful for any occasion.',
    isFeatured: true,
  ),
  const Product(
    id: '3',
    name: 'Casual Linen Dress',
    category: 'Casual',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.38,
    size: 'S',
    color: 'Beige',
    imageUrl:
        'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=600&q=80',
    description:
        'Breathable linen dress for relaxed days. Soft texture with a flattering silhouette.',
    isNew: true,
  ),
  const Product(
    id: '4',
    name: 'Evening Party Gown',
    category: 'Party',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.75,
    size: 'M',
    color: 'Deep Rust',
    imageUrl:
        'https://images.unsplash.com/photo-1566174053879-31528523f8ae?w=600&q=80',
    description:
        'Statement party dress with elegant drape. Surplus quality at unbeatable value.',
    isFeatured: true,
  ),
  const Product(
    id: '5',
    name: 'Geometric Print Dress',
    category: 'Floral',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.42,
    size: 'M',
    color: 'Cream & Orange',
    imageUrl:
        'https://images.unsplash.com/photo-1496747611176-843222e1e57c?w=600&q=80',
    description:
        'Inspired by our brand palette — geometric floral pattern on premium cotton blend.',
  ),
  const Product(
    id: '6',
    name: 'V-Neck Summer Dress',
    category: 'Dresses',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.35,
    size: 'S',
    color: 'Ivory',
    imageUrl:
        'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?w=600&q=80',
    description:
        'Classic V-neck summer dress. Light, airy, and effortlessly chic.',
    isNew: true,
  ),
  const Product(
    id: '7',
    name: 'Wrap Midi Dress',
    category: 'Midi',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.48,
    size: 'L',
    color: 'Sand',
    imageUrl:
        'https://images.unsplash.com/photo-1612336307429-8a0d2185a6dd?w=600&q=80',
    description:
        'Flattering wrap-style midi with adjustable fit. A wardrobe essential.',
  ),
  const Product(
    id: '8',
    name: 'Boho Maxi Dress',
    category: 'Maxi',
    pricePerKg: surplusPricePerKg,
    weightKg: 0.58,
    size: 'M',
    color: 'Earth Brown',
    imageUrl:
        'https://images.unsplash.com/photo-1596783074918-c84cb06531ca?w=600&q=80',
    description:
        'Free-spirited boho maxi with tiered layers. Perfect for festivals and outings.',
    isFeatured: true,
  ),
];
