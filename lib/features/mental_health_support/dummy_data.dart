import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/online_session.dart';

import '../../core/utils/app_images.dart';
import 'domain/entities/open_close_time.dart';


//==========================================================////==========================================================//
//Therapy groups
Group anxietyGroup = Group(
    id: "0",
    mentorID: '0',
    title: 'Anxiety Group',
    photoUrl: AppImages.overthinking,
    rating: 4.9,
    timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
    allAppointeesIds: ['1','2'],
    maximumAppointees: 4
);

Group ptsdGroup = Group(
    id: "1",
    mentorID: '0',
    title: 'PTSD Group',
    photoUrl: AppImages.ptsd1,
    rating: 4.9,
    timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
    allAppointeesIds: ['1','2' '3'],
    maximumAppointees: 5
);

// Group depressionGroup1 = Group(
//     id: "2",
//     mentorID: '0',
//     title: 'Depression Group',
//     photoUrl: AppImages.depression,
//     rating: 4.9,
//     timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
//     allAppointeesIds: ['1','2' '3'],
//     maximumAppointees: 5
// );


Group depressionGroup2= Group(
    id: "3",
    mentorID: '0',
    title: 'Depression Group',
    photoUrl: AppImages.depression2,
    rating: 4.9,
    timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
    allAppointeesIds: ['1','2' '3'],
    maximumAppointees: 5
);

Group sleepDisorder= Group(
    id: "3",
    mentorID: '0',
    title: 'Sleep disorder Group',
    photoUrl: AppImages.sleep_disorder,
    rating: 4.9,
    timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
    allAppointeesIds: ['1','2' '3'],
    maximumAppointees: 5
);

List<Group> sampleTherapyGroups = [
    anxietyGroup, ptsdGroup, depressionGroup2, sleepDisorder
];
//==========================================================////==========================================================//






//==========================================================////==========================================================//
//Online sessions
OnlineSession sampleOnlineSession1 = OnlineSession(
    id: '1',
    title: 'Live Session',
    subTitle: 'Breathing exercises for PTSD',
    imageUrl: AppImages.breathing1,
    instructorId: '1',
);

OnlineSession sampleOnlineSession2 = OnlineSession(
    id: '2',
    title: 'Live Session',
    subTitle: 'Breathing exercises for Anxiety',
    imageUrl: AppImages.breathing2,
    instructorId: '1',
);

OnlineSession sampleOnlineSession3 = OnlineSession(
    id: '3',
    title: 'Live Session',
    subTitle: 'Breathing exercises for sleep disorder',
    imageUrl: AppImages.breathing3,
    instructorId: '1',
);

OnlineSession sampleOnlineSession4 = OnlineSession(
    id: '4',
    title: 'Live Session',
    subTitle: 'Breathing exercises for a peacefully day',
    imageUrl: AppImages.breathing4,
    instructorId: '1',
);

OnlineSession sampleOnlineSession5 = OnlineSession(
    id: '5',
    title: 'Live Session',
    subTitle: 'Breathing exercises for a clear mind',
    imageUrl: AppImages.breathing5,
    instructorId: '1',
);

List<OnlineSession> sampleOnlineSessions = [sampleOnlineSession1, sampleOnlineSession2, sampleOnlineSession3, sampleOnlineSession4, sampleOnlineSession5];
//==========================================================////==========================================================//






//==========================================================////==========================================================//
//

//==========================================================////==========================================================//





//==========================================================////==========================================================//
//

//==========================================================////==========================================================//





//==========================================================////==========================================================//
//

//==========================================================////==========================================================//

