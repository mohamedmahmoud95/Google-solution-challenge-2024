import 'package:easy_localization/easy_localization.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/step.dart';

  OfflineResource offlineResource1 = OfflineResource(id: '1', title: "How to Bandage a Wound During First Aid".tr(),
      generalIntro: "Bandaging a wound is an integral part of first aid treatment. You never know when you or a loved one will suffer a wound that needs first aid. Although deep wounds that bleed profusely need immediate emergency medical care, most minor cuts and wounds can be managed and bandaged at home. Once you stop the bleeding and clean the wound, bandaging is actually a fairly simple procedure.",
      steps: [
        OfflineResourceStep(id: '1',
            index: '1',
            title: "Cleaning the Wound",
            imageLink: "https://www.wikihow.com/images/thumb/a/a3/Bandage-a-Wound-During-First-Aid-Step-1-Version-5.jpg/aid1235638-v4-728px-Bandage-a-Wound-During-First-Aid-Step-1-Version-5.jpg",
            bodyText: "Know when the wound needs immediate medical attention. Although most minor wounds can be bandaged with a Band-Aid and most moderate skin wounds with dressings and medical tape, some are too serious for home care. For example, skin wounds that also involve seriously broken bones need immediate medical attention, as do major injuries to blood vessels that won't stop gushing blood.[1] Wounds to the arms and legs that cause numbness or loss of sensation below the injury may indicate nerve damage, which is also an indication to seek medical care."
            "Severe loss of blood will quickly make you feel weak and tired (and maybe pass out), so tell someone around you of the seriousness of your injury right away, or call emergency services for assistance."
       " If you have a deep skin wound to your abdomen, your organs may be injured and bleeding internally, so try to get to an emergency medical facility as quick as you can — but get someone to drive you because you might lose consciousness, or call an ambulance."
                ),
      ],
      summary: "Skin wounds most likely to get infected are puncture wounds — usually caused by a sharp pointed object entering the skin, such as needles, nails, knives and teeth."
            "Most wounds that need stitches should be treated within six to eight hours after the injury to reduce the risk of infection. Particularly dirty wounds may not be stitched in order to avoid the risk of infection."
 "Keep in mind that while cosmetic results are important, it's not the primary consideration for wound repair. Healing without infection is.",
  );

  List<OfflineResource> dummyOfflineResources = [offlineResource1, offlineResource1, offlineResource1];
