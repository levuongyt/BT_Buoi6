// Viết một đối tượng Material bao gồm các thuộc tính
// 1.enum TypeMaterial (PLASTIC, STEEL, RUBBER, WOOD)
// 2.giá tiền (price)
// 3.nơi sản xuất madeIn
// 4.tên (name)
// 4.id vật liệu (private)
// ///Tìm hiểu làm sao để kiểm tra xem một từ có giá trị "flutter" có bao gồm "utter" hay không phải
// tìm google (nhớ lại cách tra cứu)
// a.Viết hàm khởi tạo cho đối tượng
// b.Tạo một đối tượng SupMaterial kế thừa class Material trên và có thêm thuộc tính có thể null là
// có thể xây nhà bool (canMadeHouse), Viết hàm khởi tạo cho đối tượng này khi khởi tạo thì tham
// số canMadeHouse là optional
// c.Viết hàm trả về đối tượng SupMaterial để trả ra kiểu SupMaterial có đầy đủ thông tin giá trị
// của canMadeHouse
// nếu là gỗ, sắt dùng để làm nhà được còn lại thì không
// d.Trong lớp SupMaterial viết về phương thức trả về danh sách kiểu SupMaterial tên phương thức
// là getResults(1,2) với tham số là
// 1.searchValue : String với yêu cầu dùng để tìm kiếm các đối tượng SupMateril mà tên sẽ gần
// giống (chứa) searchValue,
// 2.inputList: danh sách toàn bộ các SupMaterial bàn đầu
// => output trả ra danh sách đối tượng tên gần giống tham số truyền vào
// 3.nâng cấp hàm 2 thành nếu tên vừa gần giống và có thể xây nhà thì mới thoả mãn danh sách

void main() {
  SupMaterial supMaterial =
  SupMaterial(TypeMaterial.PLASTIC, 300000, 'Viet Nam', 'Ban', 1);
  supMaterial.sMasterial();
  List<SupMaterial> inputList = [
    SupMaterial(TypeMaterial.WOOD, 250000, 'Viet Nam', 'Ban', 2,
        canMadeHouse: true),
    SupMaterial(TypeMaterial.PLASTIC, 220000, 'Viet Nam', 'Giuong', 3,
        canMadeHouse: false)
  ];
  supMaterial.getResults('an', inputList);
}

enum TypeMaterial { PLASTIC, STEEL, RUBBER, WOOD }

class Material {
  TypeMaterial typeMaterial;
  double price;
  String madeIn;
  String name;
  int _idvl;

  Material(this.typeMaterial, this.price, this.madeIn, this.name, this._idvl);

  @override
  String toString() {
    return 'Material{typeMaterial: $typeMaterial, price: $price, madeIn: $madeIn, name: $name, _idvl: $_idvl}';
  }

  int get idvl => _idvl;

  set idvl(int value) {
    _idvl = value;
  }
}

class SupMaterial extends Material {
  bool? canMadeHouse;

  SupMaterial(
      super.typeMaterial, super.price, super.madeIn, super.name, super.idvl,
      {this.canMadeHouse});
  @override
  String toString() {
    return 'SupMaterial typeMaterial: $typeMaterial, price: $price, madeIn: $madeIn, name: $name, _idvl: $_idvl ,canMadeHouse: $canMadeHouse ';
  }

  SupMaterial sMasterial() {
    if (this.typeMaterial == TypeMaterial.WOOD ||
        this.typeMaterial == TypeMaterial.STEEL) {
      //print('Xây nhà được');
      print(canMadeHouse = true);
    } else {
      //print('Không xây nhà được');
      print(canMadeHouse = false);
    }
    return this;
  }
  SupMaterial getResults(String searchValue, List<SupMaterial> inputList) {
    inputList.forEach((item) {
      //if (item.name.contains(searchValue) &&item.canMadeHouse==true){// cach1

      if (item.name.contains(searchValue) &&
          (item.typeMaterial == TypeMaterial.WOOD ||
              item.typeMaterial == TypeMaterial.STEEL)) {
        print(item);
      }
    });
    return this;
  }
}
