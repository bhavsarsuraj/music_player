import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';

void main() {
  group('UserRepository', () {
    late FakeFirebaseFirestore instance;
    late UserRepository userRepository;

    setUp(() {
      instance = FakeFirebaseFirestore();
      userRepository = UserRepository(instance);
    });

    test('set current user', () async {
      // Assign
      final userModel = UserModel(id: '1');

      // Arrange
      await userRepository.setCurrentUser(userModel);
      final docSnapshot = await instance.collection('users').doc('1').get();

      // Act
      expect(docSnapshot.exists, true);
      expect(docSnapshot.data(), userModel.toJson());
    });

    test('get user', () async {
      // Assign
      final userModel = UserModel(id: '1');

      // Arrange
      await instance.collection('users').doc('1').set(userModel.toJson());

      final userFromFirestore = await userRepository.getUser('1');

      // Act
      expect(userFromFirestore, isNotNull);
      expect(userFromFirestore?.toJson(), userModel.toJson());
    });

    test('update favourite songs', () async {
      // Assign
      final userModel = UserModel(
        id: '1',
        favouriteSongs: ['song1'],
      );
      final favouriteSongs = [
        'song1',
        'song2',
      ];

      // Arrange
      await instance.collection('users').doc('1').set(userModel.toJson());
      await userRepository.updateFavouriteSongs(
        userId: '1',
        favouriteSongs: favouriteSongs,
      );
      final docSnapshot = await instance.collection('users').doc('1').get();

      // Act
      expect(docSnapshot.exists, true);
      expect(
        UserModel.fromJson(docSnapshot.data()!).favouriteSongs,
        favouriteSongs,
      );
    });
  });
}
