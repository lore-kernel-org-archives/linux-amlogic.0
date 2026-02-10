Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D18EA3F09
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Feb 2026 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2N8nZMaCDfMPwWav+1EI/QaOW6bBASWu6if9UQugi6k=; b=3nKALf93nauvJrmhEj3GzxTVEA
	LiDA4XkhOznPBqM9ZZP8ZHpbKOP1FXGUcGSjvU1J616dHpMQMJp3qHqXTTI+6Z5TS+GyaV6BS2g4c
	CqFl9rYcmCPipMrCQXKxVqEg+xfuwaqr3crU4AIIEOn7QoD6+Qch0IG0ccWa0Bo5ZpglS8piGZcx5
	+O0SsQqJRmCMsBtxhrGlOkMC5+95ra23BG0QwT1ivQD3rmx9B3Qcs0mPVVckSIWWa7Yo4qSfA2SAu
	LywmCvozH6qCtnhKTcrB4vE+gfxWnV8r4MUARmTfJOx+b142OLYIbWyj4gHTH7dzgXyIHxcVCznIi
	an2Y48Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgtE-0000000GW2V-10XE;
	Tue, 10 Feb 2026 06:06:24 +0000
Received: from mail-japaneastazon11023141.outbound.protection.outlook.com ([52.101.127.141] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgtA-0000000GW21-3xAk
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Feb 2026 06:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLzOrlGR5n/qct4GewrADDVtQOxKFqN07Bko2S0vuqfVglRewObsxktmFdtfJWr3xf5zJnihUsNQzrGe9BSCSNyeX4r2xe0QBqqItilcpJb1wrymLr+7znp7Gutq6Hiny1g/maMVQBFa+6BG9X6wXy7URrd1VYoZp6VeA2qxkfWWw6qXgA6gI8LNzK6EzZXCv3PP8fYpxYCedfYkw7pMaggLz0xkFK4LjYeJ1HoJNJ1DHTDbK8oxdnyhm6ixEUQv8qeLa8az4Xc0dP7hcpuvWP8i17BCdX3ZLz7g8dVQRk5wYQRdPUczAF/P+Muik0FLiFcS8IVsmS5zKYYnVINqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZuilx63nf/QJ0AyvKiKHeLNBT2fh6XWd6qn8nlfPY4=;
 b=UeoYZkctQPCqETiuovQfRC99Jz4uEI79WyL3AODSR+Mw89KrDCX6Fp5bNvRSx4grGT+GculRP3ZTtjzkVW3VE2sTCtvTzuPPgHpvZjYlD+waHFwRc0qJXHroONClVAszscbCztOTBeMileKaKguEEYIrdagVH+wqTiXpIZ6x39DnYqRaoe7i+dgDNOdwRfSMxKRvE+7xjXUKyLHeniDzbyUX1Pt7KRu82CJlSlzMiJbvxHvGqyXBpC6ieo437AvANC2QpO8Q674eub79RROxPBaJLJwxBCS+P9Q2FDFWul8htGq+rEiwDDKKFQF453nEhAt2kCduLuJTyxAQU6f/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZuilx63nf/QJ0AyvKiKHeLNBT2fh6XWd6qn8nlfPY4=;
 b=F2Z7R7Kftj6gM/XWzmzsbUVJY2bIWhRK1G75b4wW7XQWTBrXQB/E0TrywwP/ZzieTrmtp/kULBky/cF/uWldG7tjeTqXOh2lX0lb2dnfrbE5z5maGZBbd3NZ9+Rz002+/PR9OzexVMYScmYPKINCSeYcKfmRadQtE9XmCbv1JgN4Hcu3vr/ClmO/qxoXyf08MH7AqgdfXRb//skfSd/KvJUVdt5zUQoBnhxYe+4Rz7bX0E5VjGJh0ec32rrYybajpmyxfAx2OoXRey+71RjLeKjMjtUCEhcchP/dzKcpsn4i57jDoWe7/2U6TIQkBZ73+5YtPyFS6GsQFfgBHWfcxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KUXPR03MB9642.apcprd03.prod.outlook.com (2603:1096:d10:5f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 06:06:11 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::db31:7a14:6203:fb96]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::db31:7a14:6203:fb96%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:06:11 +0000
Message-ID: <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
Date: Tue, 10 Feb 2026 14:05:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: neil.armstrong@linaro.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
 <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
 <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
X-ClientProxiedBy: KUZPR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:d10:31::16) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KUXPR03MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2f1a51-dc6d-48dc-53f6-08de686a7d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|42112799006|1800799024|14052099004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWR3TTVETDlCRi9ibEk5WndDbG1oQUhXaXVwZjBoeDBnWUY3TTR3cVFMYzcy?=
 =?utf-8?B?bDYvUnVyR2pEeVJWT01xVkNNU3J5SE15elRRK1RWNmJYNmdMQlJBcVZhQ2Nv?=
 =?utf-8?B?ZndvcXhtaDZ0Y2lneEhzYnBJOUp4d0cvUEl4UmhJU3lja282eG9Fc1VRU2RL?=
 =?utf-8?B?UmVHQ3lUTzU5WGlEa0p5d01KN3VkZVZ4UjlkWldlbkI5aUYzdEl6WmdtVmRB?=
 =?utf-8?B?bnBZTUxuN0NTclFYME5ZbzVSU2lyRW03bll3eUF5NkJpTlgwYXNGeVlubklS?=
 =?utf-8?B?dGtyZVRLbzZIaTVGQ0NCeXQ0UzVnQnNyWlZ2SjVjWnVUaGM2RURCUGh4bHdq?=
 =?utf-8?B?Y1c4WHI4amdHV1BMOVZHZm1BdW1yNFVRaFhTVHFvNHdjNE9kTVdOOVpxRGF3?=
 =?utf-8?B?a3hCRGt6ZXN5MFNmZVFiOW4wSTV4NEdVdnBpZXd0djNzNklESnBMdy9UMGNL?=
 =?utf-8?B?emlCdDR3dytocEIzSHpvRFRGSkU3aDRUNTFWVW9CUlp6b0tETHZCbXZQUktT?=
 =?utf-8?B?b3dxNTBkbW5NTm9XNlZ4RUhBd20yWlp3T29FRjFmQWRVRXlONVoyYVdRUjk1?=
 =?utf-8?B?WVJKUlRaWDZ1d1hNYUVKMEpBZ2NFTlpnT1lMOEhEaEpBejFQWGljaWVKZzAv?=
 =?utf-8?B?TnNrRGdtb3pKMHpUeUFlVSthZGFWYXZqZUIydWphLzh6c3VjdXdnQjdSMnVn?=
 =?utf-8?B?QzRUeSsrdlp0YzNRRGNGZWN3U2xhY0hJNUVCSzNlMUZRSWtSK0tnSmREbFhJ?=
 =?utf-8?B?Tjl6RWllVWFHZGJkcFc3dWFTR1Q0Vk9PbTJIQzZ5STBSRGxReVZJU3R1MG4y?=
 =?utf-8?B?QXFPN2ZSejltRkxxM2ZwemJqNnRlZlR4NHUra0poMXVuNzFjV2tPQ2FzWUJE?=
 =?utf-8?B?eDEyZkJZckRQSWs3NXdyYVppZ2dsMGpiVEsxZGMvc3NqbEJSNXJENXVkeUQ5?=
 =?utf-8?B?Z01rZ2cvTW5XazY4YUd3L3BHZmdNWWtlU1lJV1o1N1dWcC92Z3hQWURheUgz?=
 =?utf-8?B?UVhTRlk0WFF2VFlqelcyOCtqYi9Ed2g1Wm15UHl1YnExb2pEWDVKQS9wY055?=
 =?utf-8?B?a3I0UHRrVWF3T1RlM3N2QlhpdWhEMnF4V3pNd0tIVE44ak5ZN3F0TW5vS0Qr?=
 =?utf-8?B?U3B0b3p4MHA3OEI3dGZwVVNpejR5dVRORnJTbEx1QjJaWEtCVlBNaDl1eUdR?=
 =?utf-8?B?QUE3KzgwYWEwd21GTlFkL3pQdXJpMTBkSldqWkZSV0o2bmw0bzdWNE5NU3E1?=
 =?utf-8?B?TlkyRkZVTTBaVHNtSElPMzEyaCsvSWNwNmlEamhydC9iN05MOVlLb1N1WmdO?=
 =?utf-8?B?TEZVcXhndDlqWC9MYlkxR3ZKUHZBVGROM2lyUUV5UGNPNDhCSTJXSERYcnM0?=
 =?utf-8?B?RWtTUkxqR20wUlhUY05jc3M4MDVMcVVBaDBYYjJtNEhPaWlka0lBeW4zbHpl?=
 =?utf-8?B?eWpCTk92aHFTNGVGc29SQW5RYVlWazhoa3hQZzFMaTRjK2RzZC95RHJGdmJx?=
 =?utf-8?B?SElmTEM5YXR4WnRNeEExUzdRdVFwRHEzV2JWYUZTWDhHaGJucXZtaDdSVWZ2?=
 =?utf-8?B?OUMzYUZ2Ti9RUFk3K212aFRRVU9NenhDNlozK25Ydzh3MXVQTUtaZExyZWk5?=
 =?utf-8?B?MG9idytsRkEzRTdNRkFGaGxvdWZKU1dkRlorTGQvOWxqN2lUSnNIVHdYRUNi?=
 =?utf-8?B?YjRzVnhvRzZ3eDV4bHpSRGlsWXhNY3d1NnRMazJKQXAwcW8zanh4b1U4QWor?=
 =?utf-8?B?RVczTTIvNmhibXQwbjkyV3ZlSzVscU9hOFhQd1lJckpoWkcrV1hXMWRYRTRS?=
 =?utf-8?B?TWtPelcxcUhjTncyUit4MFNSS2ZqMGtMcU0rYVQvbllCRzVCemRmWGtUTGhH?=
 =?utf-8?B?R0FoemYzT0xacTUrdy9sdmVVQTdlOGtVdk8zTnV5QlB2MzAzeUtNQ0Y4ZkVB?=
 =?utf-8?B?RFN0VUNOUEN5TklwQmdCZXZobkl0MjV6VHZYdjVQekZQUGxnYXZvS2poQWE1?=
 =?utf-8?B?UWVyL2NPUlUwK0k5dDR1bkptK2tEZmN1WEVJOUVSemNnK2hBaEZpb2YyZUYr?=
 =?utf-8?B?TkxVNTZvOE9xUXZXTEtmZWt1MGVpd2JpSkM5Y2wzVkI2Q3p4QTV3aVkzWDFx?=
 =?utf-8?Q?6Z0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7155.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(42112799006)(1800799024)(14052099004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lFcEYyUStNczVqNDFDcXMwc1RpMVRXV2tJUW5VQldyeklEYTlRUFZvZjZ2?=
 =?utf-8?B?Vnk5VWxtOE1PMTBCKzNMeEljSmhaejh5T2JUL0RTaUJOWGZyU0ovaWc3Y2I4?=
 =?utf-8?B?QXNweDhWclcyTXR6Mjk0L04zN3RsYjdvTE5GRHpQVHhOblJTMEljNTVHbFZx?=
 =?utf-8?B?RitiTkZjcXYzcktCdVltRzd2UGk3MHR1a3VFVWRDZHMzU2IwcTNMdWpMZ3E2?=
 =?utf-8?B?KzhoSGQ3U2dCQjhYcHdNSEdyY0pqZHl6OW5PZ1hYank0Q0ZEQ1RvVU0zR2Rm?=
 =?utf-8?B?Tll1cHV1bnZlQ0ZIKzBZQkNlSDhEMlpkdkl5T2ZUanA3ekwzV01FUm5KYTk3?=
 =?utf-8?B?Z2VURHlpTzR0dzQ4SFVYb0FCeTNrN2dSZC9pVTNLK1NUdDlxUHJVUEZXNCtN?=
 =?utf-8?B?dVUrdFRETmRyaXExRDBieWJVbDg0dzNiMW9DOUg4bDBaTWhOdTBrd3RzWkha?=
 =?utf-8?B?WGg0WEdKZHVka2x1US8ydlBHUHRTc0VrNHRacXgraXNHdnczanN1T0dCcHRr?=
 =?utf-8?B?d3lDWktQV1AwQXp1K2c0WlJuWGxtQlZlOEk4Q0piQXNYOHk1b2JQVTBFb1lL?=
 =?utf-8?B?WW1KRUtZQ2V5VjJaQ0RQWHFQMUpXWDlyM0xMZ0RNN2d3NmNJVDBzZFJGUEpp?=
 =?utf-8?B?U0tWUlEreHY2RWxqdE02TmVCdTlYMDR1NHFzYUZZRitReEJOQlpVcEIwbFVQ?=
 =?utf-8?B?U2lQcUtxdE5xeFpXVFNtd25HTWRiMVFhSjVnNzFNRHV5d2paQU5XZ3M5S0k3?=
 =?utf-8?B?MHhISnQrTnhRaFprRzVXSWN3cjRUUjRLR0J3c3B1SjRHRERmaWtzUFFzMGJa?=
 =?utf-8?B?UXRLazUrWm5ENlh0ZDBHM21TdzRMSEV4MVMyZWhTanpGVDZwdE92bVh3T2VI?=
 =?utf-8?B?SGFYcXBqOHlGejFKRXNoMjBsaVZjUS9maU5tK3owNk1EazYvV1hOYVZSNDk0?=
 =?utf-8?B?aE1hcDgwVnY2dkFMYXorSEMweDRoK25ZSFhRamx0elVmeEoyMGtQTTYzcEZS?=
 =?utf-8?B?a3hXZE92eUwxb05vRkp3Ky91ODV5MDBmTmxINnlrTkNJU1M4ZktxVnZKdzQ3?=
 =?utf-8?B?MUM1VDhCM3c5YVpIRUQyWjkyYit1d1d3RFcxRnBQSmRnWnF5SkNJTmZZOVVy?=
 =?utf-8?B?YzlXakYyemRXcHhTaTJrdDQ4SDl1anpYUlhIWUdseTRSS3Rtcmc5WWtyRHl6?=
 =?utf-8?B?dWRJUzBjTXdLV1libHFsdGducGY5dElMUlVJWFVkMDNUbEtGZkVzSCtTUFlx?=
 =?utf-8?B?Tk9YMllwVnJvUHBWZ1poYmR5SWRWVllMNkpiaWJNZHRIVU84UVdVdmtzVzlW?=
 =?utf-8?B?eGdNYWJ3STJpMTV1blc0VmZMWTZ5T1FNZm1wdEtNVE91TUx5QkxueXYwenpL?=
 =?utf-8?B?dmU2cnFwMi9kd3p2c1hvc2xIcTd6THJQKy9TVUtSZ1JycUhaQjVQdWpJZVRC?=
 =?utf-8?B?WWUrTEIzV2RTZ0xjVm8vQUdrNmVNYTRCME92R2ttWVlNMzJiUjlsL2ZsYjdV?=
 =?utf-8?B?R3owanRWaDNlS3BCbEFzNnEvOFZwc0VPWjhybU9oQUx4NnVWNDEyVnVNNlNW?=
 =?utf-8?B?RkQxMG55ZVRKVmFvcUp1SjhrT2xRV0g1clBtL1RJWWU5WUhRRUh2SVJYTlRo?=
 =?utf-8?B?RnVYOFVpREwvWW8rNlgweWozL2o1NzNOWEZTSU0xT0tQSURCUTdYbXMrUDI5?=
 =?utf-8?B?Y3N1Y2M2TkVKaWpSaFJYeVlxcEQ4SU5OZjlDUmV6RUhFaWtrN1FGbCswdHF5?=
 =?utf-8?B?R2x5Y2dnb0pETzd5OVVYclBHVUgxTS9hSlhwV1o2ZGYzcnYzRi9US0J6Z3li?=
 =?utf-8?B?NDQ2Slk5TUd1Y29GYzFaN1hpZWlRcGQ1Z3RDQ1duVHR4RFdtbUJ4WWphaDl4?=
 =?utf-8?B?c2N3bE91THc3N3Mxb1pyRmRiZlFhNk14cmZmQWEzdGJSUE9uVjhFSWJpdHpj?=
 =?utf-8?B?TTlBZUQxT0hjL3A5YmdJRzNNVG1IdlI5Y3JRR1BBTnJoTHFGNEhsL3lwczBV?=
 =?utf-8?B?SCtjUE1kSkdiZ1lWSXZNa2tqZ1M0c25MYmlKemhyYytwWDhzc2dHOHJ0SGps?=
 =?utf-8?B?WjE1Yzl6aHRnTVZWOHp5TFpUN0RjL1EvMG5MYU00NHlySUl1OWRDNzZkeTVq?=
 =?utf-8?B?QytKNThucU5GUURSbVgzVjZRYVVzWFY3VmgvLzdZMm9VZ2tTa1JTYXJSZlp0?=
 =?utf-8?B?RGpMK3BNV1NJY01KMjVvYnBtOCthR2xzRFVpQWxjbHp6VTZKWjhlakc3ZXpT?=
 =?utf-8?B?bWZWeGNSQ0hEczJlS3lpRTBRbVpFdXppSXJZMk5uSFVMZEJ1VFdiS3JueXZt?=
 =?utf-8?B?d05pVHJyQWd3NnkrbmZFeTU4S1VRejAxSkN6RmtTMk8yb1BCN0E4QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f1a51-dc6d-48dc-53f6-08de686a7d55
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:06:11.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlMbdgE6rizzO3MTkp3/HVRHdmdLWv4rb3/YkCXjudd89t/tHEkbRjV05JXk20PHRueNkpfGvnJgpcjtx5rtuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_220621_387575_06EEEE50 
X-CRM114-Status: GOOD (  30.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDI2LzIvMTAgNToyNiwgTWFydGluIEJsdW1lbnN0aW5nbCDlhpnpgZM6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4KPiBIaSBBbyBYdSwKPgo+IE9uIFRodSwgRmViIDUsIDIwMjYgYXQgMTI6
NTbigK9QTSBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+PiBIaSBuZWlsLCBtYXJ0
aW4sIGplcm9tZQo+Pgo+PiBUaGlzIGVtYWlsIHByb3Bvc2VzIGEgcmVmYWN0b3Jpbmcgb2YgdGhl
IE1lc29uIERSTSBkcml2ZXIgdG8gYWRvcHQgYQo+PiBjb21wb25lbnQtYmFzZWQgcGlwZWxpbmUg
bWFuYWdlbWVudCBtb2RlbCwgaW5zcGlyZWQgYnkgdGhlIEFSTSBLb21lZGEgRFJNCj4+IGRyaXZl
ci4KPiBGaXJzdCBvZiBhbGw6IHRoYW5rcyBmb3Igd29ya2luZyBvbiBhIHBsYW4gb24gaG93IHRv
IG1vdmUgdGhpbmdzIGZvcndhcmQhCgpIae+8jG1hcnRpbgoKIMKgIMKgIHRoYW5rcyBmb3IgeW91
ciBjb21tZW50cy4KCj4KPj4gVGhlIGN1cnJlbnQgTWVzb24gRFJNIGltcGxlbWVudGF0aW9uIHRp
Z2h0bHkgY291cGxlcyBkcm1fcGxhbmUgYW5kCj4+IGRybV9jcnRjIGxvZ2ljIHdpdGggc3BlY2lm
aWMgaGFyZHdhcmUgYmxvY2tzIChPU0QgTUlGLCBBRkJDLCBzY2FsZXIsCj4+IGJsZW5kLCBwb3N0
YmxlbmQpLCB3aGljaCBtYWtlcyBpdCBpbmNyZWFzaW5nbHkgZGlmZmljdWx0IHRvIHNjYWxlIHRv
Cj4+IG5ld2VyIFNvQ3MuCj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5ldyB0byB0aGlzIHBh
cnQgb2YgdGhlIERSTSBkcml2ZXIgLwo+IHN1YnN5c3RlbSAtIHNvIEkgd2lsbCBwcm9iYWJseSBh
c2sgc29tZSBub3ZpY2UgcXVlc3Rpb25zLgo+Cj4+IFRoZSBhdHRhY2hlZCAvdnB1LWJsb2NrLyBm
aWxlIGRlc2NyaWJlcyB0aGUgcHJvcG9zZWQgVlBVIGJsb2NrIHBpcGVsaW5lLgo+Pgo+PiBUaGlz
IGltcGxlbWVudCBpbnRyb2R1Y2VzIGEgZ2VuZXJpYyBwaXBlbGluZSBmcmFtZXdvcmsgd2hlcmU6
Cj4+Cj4+IC0gSGFyZHdhcmUgYmxvY2tzIChNSUYsIEFGQkMsIFNDQUxFUiwgQkxFTkQsIFBPU1RC
TEVORCkgYXJlIG1vZGVsZWQgYXMKPj4gICAgIGluZGVwZW5kZW50IGNvbXBvbmVudHMgd2l0aCB3
ZWxsLWRlZmluZWQgY2FwYWJpbGl0aWVzLgo+Pgo+PiAtIGRybV9wbGFuZSBhbmQgZHJtX2NydGMg
YXJlIHJlc3BvbnNpYmxlIG9ubHkgZm9yIGJ1aWxkaW5nIGFuZCB2YWxpZGF0aW5nCj4+ICAgICBh
IHBpcGVsaW5lLCBub3QgZm9yIGRpcmVjdGx5IHByb2dyYW1taW5nIGhhcmR3YXJlIHJlZ2lzdGVy
cy4KPj4gLSBQZXItYmxvY2sgYXRvbWljIHN0YXRlIGlzIHNlcGFyYXRlZCBmcm9tIFNvQy1zcGVj
aWZpYyByZWdpc3RlciBsYXlvdXRzLAo+PiAgICAgc2ltaWxhciB0byBLb21lZGEncyBjb21wb25l
bnRfc3RhdGUgYW5kIHBpcGVsaW5lX3N0YXRlIG1vZGVsLgo+IEkgaGF2ZSB0d28gcXVlc3Rpb25z
IGhlcmU6Cj4gLSBIb3cgaXMgcGVyLVNvQyByZWdpc3RlciBhY2Nlc3MgbWFuYWdlZD8KPiAtIEhv
dyBhcmUgImNvbW1vbiIgKHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUgLSBvciBldmVuIGFsbCBTb0Nz
KQo+IHJlZ2lzdGVycyBtYW5hZ2VkPwo+Cj4gSXQgc2VlbXMgdGhhdCB0aGUga29tZWRhIGRyaXZl
ciB1c2VzIGtvbWVkYV9kZXZfZnVuY3MgZm9yIHRoZQo+IHBlci12YXJpYW50IGFjY2Vzcy4KPiBI
b3dldmVyLCBpdCdzIG5vdCBjbGVhciBob3cgdGhpcyBzY2FsZXMgYXMgb25seSB0d28gbW9zdGx5
IGlkZW50aWNhbAo+IGRpc3BsYXkgY29udHJvbGxlcnMgKEQzMiBhbmQgRDcxKSBldmVyIG1hZGUg
aXQgaW50byB0aGUgZHJpdmVyLgoKSSB3b3VsZCBsaWtlIHRvIGZpcnN0IGRlc2NyaWJlIHRoZSBj
dXJyZW50IHN0YXRlLgoKICAgIEluIGF0b21pY191cGRhdGUgYW5kIGF0b21pY19kaXNhYmxlLCBy
ZWdpc3RlciB2YWx1ZXMgYXJlIGRlcml2ZWQKICAgIGZyb20gdGhlIHByb3BlcnR5IGluZm9ybWF0
aW9uIGFuZCBzdG9yZWQgaW50byB0aGUgcHJpdi0+dml1IGFuZAogICAgcHJpdi0+YWZiYyBzdHJ1
Y3R1cmVzLgogICAgSW4gbWVzb25fY3J0Y19pcnEsIHRoZSBwcmV2aW91c2x5IHNhdmVkIHZhbHVl
cyBhcmUgdGhlbiB3cml0dGVuIGludG8KICAgIHRoZSBoYXJkd2FyZSByZWdpc3RlcnMuCgpJbiBm
dXR1cmUgU29Dcywgd2UgbWF5IGVuY291bnRlciB0aGUgZm9sbG93aW5nIHNjZW5hcmlvczoKCiAg
KiBUaGUgcmVnaXN0ZXIgYWRkcmVzc2VzIG9mIGEgZ2l2ZW4gYmxvY2sgbWF5IGNoYW5nZS4gRm9y
IGV4YW1wbGUsIG9uCiAgICBTOTA1WDIsIHRoZSBPU0QxIHNjYWxlciByZWdpc3RlcnMgYXJlIGxv
Y2F0ZWQgYXQgMHgxZGMw4oCTMHgxZGNkLAogICAgd2hpbGUgb24gQTMxMUQyLCB0aGUgc2FtZSBP
U0QxIHNjYWxlciByZWdpc3RlcnMgbW92ZSB0byAweDVhMDDigJMweDVhMGQuCiAgKiBBIGJsb2Nr
J3MgZnVuY3Rpb25hbGl0eSBtYXkgYmUgcmVkdWNlZCBvciBleHRlbmRlZCwgd2hpY2ggY2FuCiAg
ICBpbmNsdWRlIGNoYW5nZXMgdG8gZXhpc3RpbmcgcmVnaXN0ZXIgYml0cyBvciB0aGUgaW50cm9k
dWN0aW9uIG9mIG5ldwogICAgY29udHJvbCByZWdpc3RlcnMuIEZvciBpbnN0YW5jZSwgdGhlIE9T
RCBNSUYgYmxvY2sgcHJldmlvdXNseQogICAgcmVxdWlyZWQgY2FudmFzIGNvbmZpZ3VyYXRpb24s
IHdoaWxlIG9uIFQ3QyB0aGUgY2FudmFzIG1lY2hhbmlzbSBpcwogICAgY29tcGxldGVseSByZW1v
dmVkLgogICogQW4gZW50aXJlIGJsb2NrIG1heSBiZSByZW1vdmVkIG9yIG5ld2x5IGFkZGVkLiBG
b3IgZXhhbXBsZSwgR0ZDRCwKICAgIHdoaWNoIGludGVybmFsbHkgaW50ZWdyYXRlcyBBRkJDIGFu
ZCBBRlJDIGhhcmR3YXJlIG1vZHVsZXMsIGlzCiAgICBwcmVzZW50IG9uIEE5LgoKUmVnaXN0ZXIg
cHJvZ3JhbW1pbmcgaXMgcGVyZm9ybWVkIHRocm91Z2ggUkRNQSBoYXJkd2FyZS5XaGVuIFJETUEg
aXMgCmF2YWlsYWJsZSwgdGhlIGZsb3cgaXMgZGlmZmVyZW50LgoKICAgIEluIGF0b21pY191cGRh
dGUgYW5kIGF0b21pY19kaXNhYmxlLCByZWdpc3RlciB2YWx1ZXMgYXJlIHdyaXR0ZW4KICAgIGRp
cmVjdGx5IGludG8gdGhlIFJETUEgcmVnaXN0ZXIgdGFibGUsIGFuZCB0aGVyZSBpcyBubyBuZWVk
IHRvIGNhY2hlCiAgICB0aGUgcmVnaXN0ZXIgdmFsdWVzIGluIHNvZnR3YXJlLgogICAgT25jZSBh
bGwgcmVnaXN0ZXIgd3JpdGVzIGFyZSBwcmVwYXJlZCwgcmRtYV9jb25maWcgaXMgdXNlZCB0byBs
ZXQKICAgIHRoZSBoYXJkd2FyZSBmbHVzaCB0aGUgUkRNQSByZWdpc3RlciB0YWJsZSBpbnRvIHRo
ZSByZWFsIHJlZ2lzdGVycwogICAgb24gdGhlIG5leHQgVlN5bmMuCgpPbiBhIGdpdmVuIFNvQywg
ZWFjaCBpbnRlcm5hbCBibG9jayBjb250YWlucyBmaWVsZHMgdGhhdCBkZXRlcm1pbmUgd2hpY2gg
CnJlZ2lzdGVyIHNldCBpdCBzaG91bGQgdXNlLgpUaGlzIGluZm9ybWF0aW9uIGlzIFNvQy1zcGVj
aWZpYyBhbmQgbXVzdCBiZSBwcm92aWRlZCBieSB0aGUgU29DIGRlc2NyaXB0aW9uCgo+Cj4+IFRo
aXMgaXMgYWNoaWV2ZWQgYnkgaW50cm9kdWNpbmcgZm91ciBjb3JlIG9iamVjdHMsIGFzIHNob3du
IGluIHRoZQo+PiBhdHRhY2hlZCBjbGFzcy1kaWFncmFtIGRvY3VtZW50Lgo+Pgo+PiAtIG1lc29u
X3ZwdV9ibG9jawo+PiAtIG1lc29uX3ZwdV9ibG9ja19zdGF0ZQo+PiAtIG1lc29uX3BpcGVsaW5l
Cj4+IC0gbWVzb25fcGlwZWxpbmVfc3RhdGUKPj4KPj4KPj4gVGhlIGF0b21pYyBmbG93IGlzIHN0
cnVjdHVyZWQgYXMgc2hvd24gaW4gdGhlIGF0dGFjaGVkIGNvbW1pdC1mbG93IGRvY3VtZW50Lgo+
IFRoZSBwdWJsaWMgQTMxMUQgZGF0YXNoZWV0IHBhZ2UgMzA0IFswXSBzaG93cyB0aGF0IENWQlMs
IEhETUlUWCBhbmQKPiBNSVBJX0RTSSBhcmUgcGFydCBvZiB0aGUgVlBVIGJsb2NrLgo+IFRob3Nl
IGFyZW4ndCBtZW50aW9uZWQgaW4geW91ciBmbG93cy4gSXMgdGhhdCBiZWNhdXNlIHRoZXkgYXJl
ICJhZnRlciIKPiBQT1NUQkxFTkQgYW5kIHdvdWxkIHRoZXJlZm9yZSBiZSBwYXJ0IG9mIGEgZnV0
dXJlIHJlZmFjdG9yaW5nCj4gYXBwcm9hY2g/ClRoaXMgcHJvcG9zYWwgZm9jdXNlcyBvbmx5IG9u
IFZQVSBPU0QgYW5kIHZpZGVvLXJlbGF0ZWQgYmxvY2tzLgpFbmNvZGVyIGFuZCBjb25uZWN0b3Ig
aGFuZGxpbmcgaXMgYSBzZXBhcmF0ZSBhbmQgbXVjaCBsYXJnZXIgdG9waWMuCkkgYW0gY3VycmVu
dGx5IGludmVzdGlnYXRpbmcgaG93IHRvIHJldXNlIGV4aXN0aW5nIFBIWSBhbmQgY2xvY2sgdHJl
ZSAKaW50ZXJmYWNlcyBmb3IgdGhhdCBwYXJ0LCBidXQgaXQgaXMgaW50ZW50aW9uYWxseSBrZXB0
IG91dCBvZiB0aGlzIApwcm9wb3NhbC4KPgo+IEFsc28gUk1EQSBpcyBzaG93biBpbiB0aGUgc2Ft
ZSBkaWFncmFtIGFzIHBhcnQgb2YgVlBVLiBOZWlsIGhhZCB0bwo+IHdvcmsgaGFyZCB0byBpbXBs
ZW1lbnQgaXQgYmFjayB0aGVuIGZvciBBRkJDLgo+IFlvdSBoYXZlbid0IGxpc3RlZCBpdCBpbiB5
b3VyIGRpYWdyYW1zIGJ1dCBJIGFzc3VtZSBpdCBpcyBnb2luZyB0byBiZQo+IHBhcnQgb2YgdGhl
IGltcGxlbWVudGF0aW9uIGFzIGl0IGlzL3dhcyBtYW5kYXRvcnkgZm9yIEFGQkMuCj4gQ2FuIHlv
dSBjb25maXJtIG15IHVuZGVyc3RhbmRpbmcgaGVyZSAob3IgY2xlYXIgdXAgbXkgY29uZnVzaW9u
KT8KWWVzLCB3ZSB3aWxsIGFkZCBSRE1BIGZ1bmN0aW9uIHN1cHBvcnQgZmlyc3RseS4KPgo+PiBU
aGUgaW50ZW50aW9uIG9mIHRoaXMgcHJvcG9zYWwgaXMgbm90IHRvIGNoYW5nZSBoYXJkd2FyZSBi
ZWhhdmlvciwgYnV0IHRvCj4+IGdyYWR1YWxseSByZXN0cnVjdHVyZSB0aGUgZHJpdmVyIHRvIGlt
cHJvdmUgbWFpbnRhaW5hYmlsaXR5LCBzY2FsYWJpbGl0eSwKPj4gYW5kIGNvcnJlY3RuZXNzIG9m
IGF0b21pYyBzdGF0ZSBoYW5kbGluZyBhY3Jvc3MgZGlmZmVyZW50IE1lc29uIFNvQ3MuCj4+Cj4+
IFRoaXMgaXMgYW4gaW5pdGlhbCBwcm9wb3NhbCBpbnRlbmRlZCB0byBnYXRoZXIgZmVlZGJhY2sg
b24gdGhlIG92ZXJhbGwKPj4gYXJjaGl0ZWN0dXJlIGJlZm9yZSBjb252ZXJ0aW5nIGV4aXN0aW5n
IGNvZGUgcGF0aHMgaW5jcmVtZW50YWxseS4KPiBNYWtpbmcgaW5jcmVtZW50YWwgY2hhbmdlcyBz
b3VuZHMgZ3JlYXQhIFRoZSBtZXNvbiBEUk0gZHJpdmVyIGlzIHRvbwo+IGJpZyB0byAianVzdCIg
Y29weSBpdCBhbmQgbWFrZSBtb2RpZmljYXRpb25zIChvciBldmVuIG1vZGlmeWluZyBpdAo+IGRp
cmVjdGx5IHdpdGggb25lIGh1Z2UgcGF0Y2gpLgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGlu
Cj4KPgo+IFswXSBodHRwczovL2RsLmtoYWRhcy5jb20vcHJvZHVjdHMvdmltMy9kYXRhc2hlZXQv
YTMxMWQtZGF0YXNoZWV0LnBkZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
