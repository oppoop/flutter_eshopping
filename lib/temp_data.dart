import 'data_model/category.dart';
import 'data_model/product.dart';
import 'package:flutter_eshopping/generated/l10n.dart';

const String manLookRightImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/man-look-right.jpg';
const String dogImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/pet.jpg';
const String womanLookLeftImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/woman-look-left.jpg';

Category menCategory = Category(title: S().men, selections: [
  "Shirts",
  "Jeans",
  "Shorts",
]);
Category womenCategory = Category(title: S().women, selections: [
  "Shirts",
  "Jeans",
]);
Category petCategory = Category(title: S().pet, selections: [
  "Toys",
  "Treats",
]);

List<String> modelSize = ["身高","胸圍","腰圍","臀圍","模特兒尺寸"];

List<Product> products = [
  Product(
      productID: "1",
      name: "2-Pack Crewneck T-Shirts - Black",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/71UqhKT2MDL._AC_UX466_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81K7OAepB9L._AC_UX466_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/812T%2Bu00R4L._AC_UX466_.jpg"
      ],
      cost: 12.99,
      category: menCategory,
      productType: "shirts",
      sizes: ["S", "M", "L", "XL"],
      details: [
        "Logo印花襯衫",
        "圓領",
        "標準剪裁",
        "棉混合物",
      ],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "M"]),
  Product(
      productID: "2",
      name: "Short Sleeve Henley - Blue",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg",
      ],
      cost: 17.99,
      category: menCategory,
      productType: "shirts",
      sizes: ["XS", "S", "M", "L", "XL"],
      details: [
        "素面襯衫",
        "圓領",
        "直排釦子",
        "標準剪裁",
        "棉混合物",
      ],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "M"]),
  Product(
    productID: "3",
    name: "Polo RL V-Neck",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL._AC_UX522_.jpg",
    ],
    cost: 24.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
    details: [
      "POLO襯衫",
      "v字領",
      "標準剪裁",
      "棉混合物",
    ],
    modelSize: ["180", "36.6/93", "28.7/73", "36/92", "M"],
  ),
  Product(
      productID: "4",
      name: "Athletic-Fit Stretch Jeans",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL._AC_UY679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL._AC_UX522_.jpg",
      ],
      cost: 29.99,
      category: menCategory,
      productType: "jeans",
      sizes: ["W28", "W30", "W32", "W34", "W38"],
      details: ["單寧牛仔褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "W30"]),
  Product(
      productID: "5",
      name: "Levi's Original Jeans",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL._AC_UX522_.jpg",
      ],
      cost: 39.99,
      category: menCategory,
      productType: "jeans",
      sizes: ["W28", "W30", "W32", "W34", "W38"],
      details: ["Levi's 單寧牛仔褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "W30"]),
  Product(
      productID: "6",
      name: "2-Pack Performance Shorts",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg",
      ],
      cost: 19.99,
      category: menCategory,
      productType: "shorts",
      sizes: ["XS", "S", "M", "L", "XL"],
      details: ["中腰設計", "運動風", "標準剪裁", "鬆緊帶", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "M"]),
  Product(
      productID: "7",
      name: "Levi's Cargo Shorts",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg",
      ],
      cost: 29.99,
      category: menCategory,
      productType: "shorts",
      sizes: ["XS", "S", "M", "L", "XL"],
      details: ["Levi's 短褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "M"]),
  Product(
      productID: "8",
      name: "2-Pack Short-Sleeve Crewneck",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81LDpImWPAL._AC_UX522_.jpg",
      ],
      cost: 16.99,
      category: womenCategory,
      productType: "shirts",
      sizes: ["XS", "S", "M", "L", "XL"],
      details: [
        "素面襯衫",
        "V領",
        "標準剪裁",
        "棉混合物",
      ],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "S"]),
  Product(
      productID: "9",
      name: "Waffle Knit Tunic Blouse",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg",
      ],
      cost: 22.99,
      category: womenCategory,
      productType: "shirts",
      sizes: ["XS", "S", "M", "L", "XL"],
      details: [
        "素面襯衫",
        "V領",
        "標準剪裁",
        "棉混合物",
      ],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "S"]),
  Product(
      productID: "10",
      name: "Mid-Rise Skinny Jeans",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/71canaWSlAL._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/71zLzCwbXUL._AC_UX522_.jpg",
      ],
      cost: 28.99,
      category: womenCategory,
      productType: "jeans",
      sizes: ["W28", "W30", "W32", "W34", "W38"],
      details: ["單寧牛仔褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "W30"]),
  Product(
      productID: "11",
      name: "Levi's Straight 505 Jeans",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg",
      ],
      cost: 34.99,
      category: womenCategory,
      productType: "jeans",
      sizes: ["W28", "W30", "W32", "W34", "W38"],
      details: ["單寧牛仔褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "W30"]),
  Product(
      productID: "12",
      name: "Levi's 715 Bootcut Jeans",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg",
      ],
      cost: 34.99,
      category: womenCategory,
      productType: "jeans",
      sizes: ["W28", "W30", "W32", "W34", "W38"],
      details: ["單寧牛仔褲", "無內裡", "標準剪裁", "鈕扣設計", "腰帶圈", "棉混合物"],
      modelSize: ["180", "36.6/93", "28.7/73", "36/92", "W30"]),
  Product(
      productID: "13",
      name: "3-Pack - Squeaky Plush Dog Toy",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg",
      ],
      cost: 9.99,
      category: petCategory,
      productType: "toys",
      details: ["絨毛玩具", "多種動物", "棉混合物"],
      modelSize: ["20*5*15"]),
  Product(
      productID: "14",
      name: "Wobble Wag Giggle Ball",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg",
      ],
      cost: 11.99,
      category: petCategory,
      productType: "toys",
      details: ["充氣玩具", "彈跳球", "橡膠"],
      modelSize: ["30*30*30"]),
  Product(
      productID: "15",
      name: "Duck Hide Twists",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg",
      ],
      cost: 8.99,
      category: petCategory,
      productType: "treats",
      details: ["寵物點心", "恬然成分", "貓狗皆可食用"],
      modelSize: ["100/1Pack"]),
  Product(
      productID: "16",
      name: "Zuke's Mini Training Treats",
      imageUrls: [
        "https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg",
      ],
      cost: 10.99,
      category: petCategory,
      productType: "treats",
      details: ["寵物點心", "恬然成分", "貓狗皆可食用"],
      modelSize: ["100/1Pack"]),
];
