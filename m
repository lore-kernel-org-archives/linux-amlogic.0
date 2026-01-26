Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03849D13C0D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jan 2026 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPkqf8BL77fOE1Ub51ASa5omhqko2ns3fuJLLM9UM8k=; b=TvRM0NvxZlA8WeR6BR5FDeyrbR
	R5+LrdRfcdyLEFsxxUeXZqd3VCOAujQiuT+yz+dPwDJEVbN84V1X5s7JTiZKOt8zEj3u+tbqpFnsN
	kRwd8sL3+ABSKqxaa7kNN90F9e08Dnvz4sBqELzJjWIODi7CS2GkD7k1JbaR/lQTO8jf6vee0ccwy
	uzj45QWt99ZplnEw+c71ZDlFfrFnEz8tE79gd1WujCvAe/74oWn1FjDbiItaJRIqKkTX48DEdfOJB
	z1lfVH+K7skISJ3hixq49YAR1CfOokWWMc/3zeB9eLtv96TAZRybjr9IK2rIBJDW+JeAsbx2DoOIM
	REzDWlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMcz-0000000CcOD-0dy0;
	Mon, 26 Jan 2026 13:27:37 +0000
Received: from mail-japaneastazon11023078.outbound.protection.outlook.com ([52.101.127.78] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMcv-0000000CcNf-3bDd;
	Mon, 26 Jan 2026 13:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaMNOyjxJNiy7zz6W9uXg6zaEsaDB1zu/GWmYHbZhiFviSJmqyCXFDhhbeGeCLNw5FM8iRM1G0po0tzUKoQ9Vkq5Ei+aB5DgafYtg5TOmfZEYL8fxwtALK3xuDmFSjfberCKq7iQE6LxsBDH7mP8M6Ybenb5Zk5PmyQClztS6WumidktF7TjMjtYI+5uL23FqQJufss7VLPHhF35d7+EwxuKGTS/0Evbw7qdrrZGt9VBoqKRo4SjO6fpd8Rhq5PoouzSe5Qn7/2+FkxgZyARvfGoy6+RxJLKUXMhOz33asm7lv7frJygueHVrHr/A3pPixVa14+rs23EI99ijTGsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WUnwtpk1CHSgkruLofQxZcsYCgHbUxbpvfr3+lctSQ=;
 b=PsEi3PPGPHYY90WbaBny174x4LvS/TKKez6Z3Oefw/mEnVc6Ix1GTk6ItLaDdvwAZGRngJyrLkjFeqXHGWrE2CTt6Z4QhXDH4r+nIoxuurhqcZKhjL3q9Q5CndZ9ovJMLIUBuUt3n8A8odGqHuQgYqE7khkQ54P40bdCxldvEwbirdKZ3Ljx68/rhmFIPrVHVzX/C/H94+KXZ57rr7T6oS6zoQAv5NEibfmUoWF5nLegcKecCd0h3nRE16mGPI7DMWWSy9yB87Q+EcdQi87G5JmOPGsm6o7YUF6zRPmgV2xJW22Fg+fBoqajyK9lkuqUl8C5Qd4lA7ckQKl8rMVZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WUnwtpk1CHSgkruLofQxZcsYCgHbUxbpvfr3+lctSQ=;
 b=zEYkX/zwyLHH9TfG/SC93ItWHvDigloMfCyIoTAFnEYJKXA65x6jXAefsBe4iUzHvgV70sQScqLZmafqk9CPKvUpfoRQZeHJtvvm6Pua9DUfIJ0hBwSKtKQHyW7njaE+ZkgzJOnJ2LVM5iEr98vlBBOYn1PWWAMNZqnj+Yp754LSKOGEYzZsZFOGkaDialKq3+u0lcq9cw7JqqXk4YxbbBx360Q+598rf/CWiXMYIBtjPdqK85O89mLZ1XzTKjFh44AnNHDVs+DIahnKzVg5SgaG4QtyfWIpOy0J+8wLc/X/OIb0R3ln7zdQIXaSdVXbM4kEfGYQwMqMEcva4Auocg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB7316.apcprd03.prod.outlook.com (2603:1096:101:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:27:27 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:27:27 +0000
Message-ID: <6ae1e866-b3ce-4c5d-96f7-3d73b97a1ced@amlogic.com>
Date: Mon, 26 Jan 2026 21:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com>
 <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 75980abf-f55e-4ec1-39f4-08de5cdea5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnlSVXp6bTg1THN0ODhlckIwbFJUKzBRMWpWM3A0ZmdXNEsvcDd5aDFpUFp5?=
 =?utf-8?B?V1dhbGZSSTVoL1lsMkNUc2lqbExuNjBnVGx0Y05WT1VPeDhXSWN4ZmhYbFBq?=
 =?utf-8?B?eU0rYm5TNWl4VlhmUzNJUnlGSVdmck9xVDhQRFZ0Nkw2SHltTTdsTC95a2gy?=
 =?utf-8?B?Mnk5c1hlN3VaOGlSZmRlbm1MQTIyYW1VRHViZHNGLzM5NmJXd3N4TDBSczB2?=
 =?utf-8?B?NUlMSlpwRlU0b2pya0dCaDY5WFZxTDAwVWFraWpJOTNRa3JlTkp1RDhXVTNT?=
 =?utf-8?B?MkIwV3VheGZEcEdGQWZvY2NBUHVoOTJOTVBWTDA5YjcrYllPM0l2LzhpZE9u?=
 =?utf-8?B?MFE4enQyakdOTXorYkd2eEJrTXFtd1NUcVlKMWRUWGxOK0NiRks2cGtnMnl6?=
 =?utf-8?B?NXpZeG5aUmsrMTRvaG1WQnI4aEF3dFArNGgxYnhwSVRCQVJWb21Sekphd1ZJ?=
 =?utf-8?B?eFI1Vnl3YzgyanFjYUxDUTNOamIydzJsN2xtNEREaGE2eDh6RFNKZmRaUG80?=
 =?utf-8?B?bHJZRmNrNFFueVdWalJ6VjExYnY1Z2JHSkRHSmhtL25UTjc2bU1YZWlUTnYz?=
 =?utf-8?B?NEp2blA2TlhZTTRkREM5WFV4bDN0cG5NWEtrVnF5UTNsbjJkdGQvUTE2ZFBn?=
 =?utf-8?B?T0pZaitydlhKUjBKSkZLcFRQOGdrakhwcU1xY0s1RnBUYTljaTBsYnhRaFNU?=
 =?utf-8?B?QVhSWFAxUXlnQXpsUDRqNmdXTVdUbUMweGQ2K2UzZ2xtN0F4YlVuQmZIL3FR?=
 =?utf-8?B?bzVrSHBJM0NDQnRUK1dRUU1ZOXJzcEpQYzRNalgvOFZraGZSd1dNKzk2YVJq?=
 =?utf-8?B?ZEl6bS9BQWJBZDlJKy8xaWVtNkFhdlh5Snp1OXVucDBEVXRCelVhaXdIdm43?=
 =?utf-8?B?ZXRVdVd5NVl1Zm9DckJFa1dPcHFERUVLZ1pvdGRvdEFieExORGdFR0x0eGRq?=
 =?utf-8?B?RERCMW5RTUNONGZvOXFJUWdQRENYcEMxKy9sb2ZlM25qY2hBQjJLdWFRWDZw?=
 =?utf-8?B?MDZBbHplbjI4MUI2eC9ITHNyUWhDdHREbUFqWUlzTk0wdEpHb3YzcktmWDI4?=
 =?utf-8?B?R3kvRHF0RlhLQVFYaW84V0hNaTl0ZUkrNEd6VWlpWmNLaVdjazFNVmNFRWla?=
 =?utf-8?B?alNST1BScTN3Vmk0MDB0d2JuaGk3OXI1V2FLUUcrL1NrOWdTZkc1Q3A0enhk?=
 =?utf-8?B?RlNHSW9yWVVVQWd4NWNjam1laWZsWFVQT0U1TGtrbHozQlE3K2MyNkMyMXRo?=
 =?utf-8?B?anFHWVZHTThaamVGZkxuOHBDWDJuclhBRnFyVnFISzdQV3hDclRFaEk5aTRV?=
 =?utf-8?B?WVZxNzdkREtFaEhDSVRRcFdQRktMZ1MwTlp0L0kvNjQzZDlNOFVOTTNpa2xN?=
 =?utf-8?B?MnpBZ0kwUVVsZDZPd3Q5TG9HS3lad1N4c01EWGwvTDRXaStzVzNOZitvalpq?=
 =?utf-8?B?MjVLbmJnTkl3NnFUWEtPZlRHWVRjM0tES2VtVHBYbHlhV0FOTkQwNEs1d1BT?=
 =?utf-8?B?eWFRZDhvZ1FTTDhBczl2dEc2TmFDZk0vejRHY1lZTDVhNjh3TllXU0ErMmVE?=
 =?utf-8?B?WjN0OVh0cEZuNXM0Wi9FQytzbStyOFl5UEtPVURNTFV3WC9kZGNLUk1OOWFZ?=
 =?utf-8?B?dTZYMG52QkdqUndhWnVjaHVYdnA5d2RlMTdaM0c0M08wTUg5Mk1WTXpvRkhx?=
 =?utf-8?B?b3prMWtXVFVRYVFib3NVTHBiSmlKcHdEQ0cvd3ZETzI2ZWsreERZeSs5RlVC?=
 =?utf-8?B?Z1gvNkh1Vk9hanNlbkkxeDF5bjdpUitFb0xUOGIyZnJrU3V5VG9IQXoyWXph?=
 =?utf-8?B?Sk9VTHI4RlBxY2R0NmljS0hTdk5CNlRjZUF3OXZDazgxWER6WUJncGNqdFhp?=
 =?utf-8?B?STlXSm52WnF5WDM1RUlya2NCb0F0NUcyYXlxTmtCMWxIZEl5WWRDeWdQOGZT?=
 =?utf-8?B?RHY0aC9iV0ZRMjRBZGFjd21PY2dNSG9hKzNHSXZrNzBGQXVhY0RnUGlGR0VT?=
 =?utf-8?B?dWxaS1FybGo5MlE4dTFmT1B6N2dGQncweHlQcHd6aWZCK0d0MXhPT05YZFpp?=
 =?utf-8?B?Z0JDR01MR1psREdaSUhwMEJVTlpnZWxCMy9QZTNpWWlkelg4bkw4Z0VOYnlG?=
 =?utf-8?Q?zsRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJaUE4rODBMUVhJaC9IK1V4Z2ZCSWFyMncyOU1ZVDAxUHZCcVBTSkt2N25C?=
 =?utf-8?B?bEZkNC9XalNrVGRYdWpSeUtMemRFZzlkalVSRjduM3pEcUVNRURSTW9CNFJl?=
 =?utf-8?B?aXZXTVVmOXFrQUN6QzhWT2pjczFlREVLTkhVUUJCTTNoaFJ1dXBuRTAzTjFi?=
 =?utf-8?B?WFR1bEU5Nmd6TW5XejdxdFpDV1BRcDFCN2c0V28zYU94eUYzOCtEVDFkUFRQ?=
 =?utf-8?B?eFVOc1JKeW9PamZZLytDRGwwNGd2RGJLck1lSTJReTI2NjVSMEVwRXBRZGRv?=
 =?utf-8?B?T3E4YTh6ZWVPUlkzUi92c1huNVE4bDh3SnV6YkZ6QzVORFBoVkh2ejNiZGR5?=
 =?utf-8?B?QVVSaDVJWTBjdTFOT1dTMU1KSWhSTFQzaTdNRkRYZWljVHhRUW55eGYzMDFU?=
 =?utf-8?B?N04wdnZNdW83RDFWVEZiSWhuenRNRGZTMnZoSERMYWdueXdUK3kvZ2pXYXk2?=
 =?utf-8?B?MVcxeGs0U1ZISm94cnJoZW55TkhrbXF1OXFydnAvbmJWRi9RbGcvQWh6Nnhs?=
 =?utf-8?B?ZE5icGVIaHpGTlNicS94bko2aUVrSEU4ZzhLMnNXd1lnMmtxdTU3T2dCVUtM?=
 =?utf-8?B?VXRoOUlUNGhkVm81RGlpeVM3WUVGQThMNjhPa0hMMkFNY0UyMnp3TURaSEdn?=
 =?utf-8?B?Zzh5cEcwaWlMUVVzUnJKZWkxdTdTeklHZ3Jjd00vbmhZaHlZci9wTlE2MDZr?=
 =?utf-8?B?Szh6YjNZd29mRkZzMXhrOVFBUENkd1NNZzBySmlzTFlRQ2ErZ2E1a2ZSM1hB?=
 =?utf-8?B?YkRrRXBRU3FCSFE1K0tmYythNFp1M0x0dmVoQncrdFc5MDMxU0IrWkUwczVp?=
 =?utf-8?B?VkVTeTVjRGhwVW9OcGFENEo4VXZWL2h3RjJ4c29PVUlhb1h6djRLb04weUxG?=
 =?utf-8?B?cDNXb1htNEZCZTg5VTdPbU9HcUZGSTk3dWpmbS9jM1VXdnJWdG1rb2ZWN0Nw?=
 =?utf-8?B?VE9UVGdrMWx1SUc0RVMvWGR3WWJNYXhuK3VWekkrWlAxNkJOSkgyZTVXQzFv?=
 =?utf-8?B?RDFUeGJBaEthSWRsNk81bGVRZGl0Sk5FUjFXc1RlNHJXZnlRYmU5dUJvdFJI?=
 =?utf-8?B?OTFEZzhqUlkwWFZFZzJML0hwc0dDZ2JMM0o2dFYzMC9pTWhNVHdpNWxSVzU2?=
 =?utf-8?B?WjFzNVZ6c0V2WmlhQVdPeXRWbW9OSUR0VVZOVVFVWjhnVVN5czY1S2tpYzZx?=
 =?utf-8?B?K3NqTmQwemdZWFRmbEtXVTdrUzdOak1mWVowRGppMjQycmZ1SlFacysrckNz?=
 =?utf-8?B?VnBNYThrbFQ4SGxWeFU2V3JHcWF6ZU1BK0ZJQUg5UXI0SDl1dC9UL3pEajVO?=
 =?utf-8?B?MjVCa2ZaTFllRCs4RUcyRTdqMjF0VTUreXRpbUs0dm1GMmdveXdIcFNtaklO?=
 =?utf-8?B?SDB1SmJ0ZWk4dENWSEhTUzVaQURCbXFQbWYvOUdGZ2M1SVNTUi9WMEl6eVNO?=
 =?utf-8?B?VElWNXNteEladWkxdHVsMjlha2JCVFhWcm1VQWVzSFNFclBZQmtZa0dmU1dI?=
 =?utf-8?B?SElwZDJFVWl4T1NTUjUvN05Pcjh0Qmo0b3hXWkZjaW5uMm45WXNwTllYbHlJ?=
 =?utf-8?B?UjRzdlF5RHZGa1E4NXNUMkxnclJ4dDJBYnc4ZlFsd3ozMXF3UlcwN2tCVVVk?=
 =?utf-8?B?SlZOWW92ZWxjNnNzNXBqelB1cHBIMzZRZkJ2UHFINGRpdjZjSzZGNHpOK3JG?=
 =?utf-8?B?Zi8zaVFlWU9SOVdvQ2pkb2RSQXE1cnAzLzhXcVN5Nk5sTGt4T09QQUZQRkV4?=
 =?utf-8?B?ZFIwTlBJUnBGbHNtOUJQdy91OXVSalhIUW16dkhiNGFvQTBiVE9NRGs0VzJM?=
 =?utf-8?B?TkQzNVk3eVVrMlJwVktKQ3IweFVWcmFyejgxaWxUMUJYQ1hKcXdWRkpLcFNZ?=
 =?utf-8?B?UkdIZ3VNK21iWm16eXFRc3hwcUp3VUtpRGNzcjJkU1RBNDBvQnBUK3RpV0VT?=
 =?utf-8?B?SUJYTmlNTVl4RS90eTVheWx4b0ZIQ0NaZHdiRXI2dXArTGRneExnSFYrcGVl?=
 =?utf-8?B?aWN0cHlPbkRDc2NXY3lQblFwM2JPekZGRlZQcjM3MEYzYis3YVRKMDNJMzNm?=
 =?utf-8?B?S1VlSHA1YkhsWWxvZkhLeS9hcDNFUjJLS1JOMGZKSUlUU3J4OW5hWGcxTEc1?=
 =?utf-8?B?cThWeGpOZDN0QWdSQVFtTnRTbnRsektYYjg2MjcyaXBwZU5aREtjMHVvUkFC?=
 =?utf-8?B?QjEvSWYybUcwZ3YweitWUmFWN3QwWG9HTUw2Z1YxbzVXc2s0cE1qYWx5dzNs?=
 =?utf-8?B?K2hKWnJLc2xNdURUWHdjYVBlTWI0a3NPNjRoTGo2eXpPc0ttOUdQb3M0YU9B?=
 =?utf-8?B?VU1xc0tOV0ZxR1VTeE1ZbVRHL05ZQ1QyTnBsOUlLWlpQZ1BzbndVc0tzc3pj?=
 =?utf-8?Q?/w2Q7Y58uhKZQjEE=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75980abf-f55e-4ec1-39f4-08de5cdea5dd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:27:27.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKLPPaEXbY9rVcDGrzdLuwEgxsvo4DZTkl12w1nvq0T4I+/b+ySOSnAZfZ2lcD5TFHF7g4yTgRo6aZWqcCSY13+vYjwds4YX4uSu5RZrQlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_052734_016119_25603F64 
X-CRM114-Status: GOOD (  15.62  )
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

CuWcqCAyMDI2LzEvMjYgMTk6MDQsIEplcm9tZSBCcnVuZXQg5YaZ6YGTOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gbHVuLiAyNiBqYW52LiAyMDI2IGF0IDA2OjAxLCBKaWViaW5nIENoZW4g
dmlhIEI0IFJlbGF5IDxkZXZudWxsK2ppZWJpbmcuY2hlbi5hbWxvZ2ljLmNvbUBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+PiBGcm9tOiBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNv
bT4KPj4KPj4gVGhlIFM0IHJlcXVpcmVzIGFkZGl0aW9uYWwgY2xvY2sgY29udHJvbCBiaXRzIHRv
IGJlIHR1cm4gb24gd2hpbGUgZW5hYmxlZC4KPj4gVGhlIFM0IGhhcyA4IFRETSBsYW5lcywgaW5z
dGVhZCBvZiA0IG9uIHByZXZpb3VzIFNvQy4KPj4gVXBkYXRlIHRoZSB3aWRnZXQgYWNjb3JkaW5n
bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppZWJpbmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9n
aWMuY29tPgo+PiAtLS0KPj4gICBzb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jIHwgMzYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDM2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9nMTJh
LXRvYWNvZGVjLmMgYi9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCj4+IGluZGV4IGE5
NTM3NWI1M2YwYS4uYTdmOWFjMmQwOGY3IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvbWVzb24v
ZzEyYS10b2Fjb2RlYy5jCj4+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMK
Pj4gQEAgLTQxLDYgKzQxLDkgQEAKPj4gICAjZGVmaW5lICBDVFJMMF9CQ0xLX1NFTF9MU0IgICAg
ICAgICAgNAo+PiAgICNkZWZpbmUgIENUUkwwX01DTEtfU0VMICAgICAgICAgICAgICAgICAgICAg
IEdFTk1BU0soMiwgMCkKPj4KPj4gKyNkZWZpbmUgQ1RSTDBfQkNMS19FTkFCTEVfU0hJRlQgICAg
ICAgICAgICAgIDMwCj4+ICsjZGVmaW5lIENUUkwwX01DTEtfRU5BQkxFX1NISUZUICAgICAgICAg
ICAgICAyOQo+PiArCj4+ICAgI2RlZmluZSBUT0FDT0RFQ19PVVRfQ0hNQVggICAgICAgICAgIDIK
Pj4KPj4gICBzdHJ1Y3QgZzEyYV90b2Fjb2RlYyB7Cj4+IEBAIC0xNDEsNiArMTQ0LDEzIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBzbTFfdG9hY29kZWNfd2lkZ2V0
c1tdID0gewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZzEyYV90b2Fjb2RlY19vdXRf
ZW5hYmxlKSwKPj4gICB9Owo+Pgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1f
d2lkZ2V0IHM0X3RvYWNvZGVjX3dpZGdldHNbXSA9IHsKPj4gKyAgICAgU05EX1NPQ19EQVBNX01V
WCgiU1JDIiwgVE9BQ09ERUNfQ1RSTDAsIENUUkwwX0JDTEtfRU5BQkxFX1NISUZULCAwLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICZzbTFfdG9hY29kZWNfbXV4KSwKPj4gKyAgICAgU05EX1NP
Q19EQVBNX1NXSVRDSCgiT1VUIEVOIiwgVE9BQ09ERUNfQ1RSTDAsIENUUkwwX01DTEtfRU5BQkxF
X1NISUZULCAwLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICZnMTJhX3RvYWNvZGVjX291
dF9lbmFibGUpLAo+IEkgZ3Vlc3MgdGhhdCB3b3JrcyBidXQgaXQgaXMgYSBiaXQgaGFja2lzaCB0
byBoaWphY2sgdGhlIG91dHB1dCBjb250cm9sCj4gdG8gZW5hYmxlIGEgc29tZXRoaW5nIHJlYWxs
eSBjbG9jayByZWxhdGVkLiBBIHN1cHBseSB3aWRnZXQgY29ubmVjdCB0bwo+IHRoaXMgd2lkZ2V0
IHdvdWxkIGJlIG1vcmUgYXBwcm9yaWF0ZSBJIHRoaW5rCgpIaSwgamVyb21lCgpUaGFua3MgZm9y
IHlvdXIgc3VnZ2VzdGlvbi4gQSBzdXBwbHkgd2lkZ2V0IGlzwqAgYXBwcm9wcmlhdGUuCgpJIHdp
bGwgYWRkIHRoZSBzdXBwbHkgd2lkZ2V0IGluIG5leHQgdmVyc2lvbgoKPj4gK307Cj4+ICsKPj4g
ICBzdGF0aWMgaW50IGcxMmFfdG9hY29kZWNfaW5wdXRfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNt
X3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPj4g
QEAgLTIzNCw2ICsyNDQsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3
IHNtMV90b2Fjb2RlY19jb250cm9sc1tdID0gewo+PiAgICAgICAgU09DX1NJTkdMRSgiTGFuZSBT
ZWxlY3QiLCBUT0FDT0RFQ19DVFJMMCwgQ1RSTDBfTEFORV9TRUxfU00xLCAzLCAwKSwKPj4gICB9
Owo+Pgo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHM0X3RvYWNvZGVj
X2NvbnRyb2xzW10gPSB7Cj4+ICsgICAgIFNPQ19TSU5HTEUoIkxhbmUgU2VsZWN0IiwgVE9BQ09E
RUNfQ1RSTDAsIENUUkwwX0xBTkVfU0VMX1NNMSwgNywgMCksCj4+ICt9Owo+PiArCj4+ICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIgZzEyYV90b2Fjb2RlY19j
b21wb25lbnRfZHJ2ID0gewo+PiAgICAgICAgLnByb2JlICAgICAgICAgICAgICAgICAgPSBnMTJh
X3RvYWNvZGVjX2NvbXBvbmVudF9wcm9iZSwKPj4gICAgICAgIC5jb250cm9scyAgICAgICAgICAg
ICAgID0gZzEyYV90b2Fjb2RlY19jb250cm9scywKPj4gQEAgLTI1Niw2ICsyNzAsMTcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIgc20xX3RvYWNvZGVjX2Nv
bXBvbmVudF9kcnYgPSB7Cj4+ICAgICAgICAuZW5kaWFubmVzcyAgICAgICAgICAgICA9IDEsCj4+
ICAgfTsKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRfZHJpdmVy
IHM0X3RvYWNvZGVjX2NvbXBvbmVudF9kcnYgPSB7Cj4+ICsgICAgIC5wcm9iZSAgICAgICAgICAg
ICAgICAgID0gc20xX3RvYWNvZGVjX2NvbXBvbmVudF9wcm9iZSwKPj4gKyAgICAgLmNvbnRyb2xz
ICAgICAgICAgICAgICAgPSBzNF90b2Fjb2RlY19jb250cm9scywKPj4gKyAgICAgLm51bV9jb250
cm9scyAgICAgICAgICAgPSBBUlJBWV9TSVpFKHM0X3RvYWNvZGVjX2NvbnRyb2xzKSwKPj4gKyAg
ICAgLmRhcG1fd2lkZ2V0cyAgICAgICAgICAgPSBzNF90b2Fjb2RlY193aWRnZXRzLAo+PiArICAg
ICAubnVtX2RhcG1fd2lkZ2V0cyAgICAgICA9IEFSUkFZX1NJWkUoczRfdG9hY29kZWNfd2lkZ2V0
cyksCj4+ICsgICAgIC5kYXBtX3JvdXRlcyAgICAgICAgICAgID0gZzEyYV90b2Fjb2RlY19yb3V0
ZXMsCj4+ICsgICAgIC5udW1fZGFwbV9yb3V0ZXMgICAgICAgID0gQVJSQVlfU0laRShnMTJhX3Rv
YWNvZGVjX3JvdXRlcyksCj4+ICsgICAgIC5lbmRpYW5uZXNzICAgICAgICAgICAgID0gMSwKPj4g
K307Cj4+ICsKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgZzEyYV90b2Fj
b2RlY19yZWdtYXBfY2ZnID0gewo+PiAgICAgICAgLnJlZ19iaXRzICAgICAgID0gMzIsCj4+ICAg
ICAgICAudmFsX2JpdHMgICAgICAgPSAzMiwKPj4gQEAgLTI3Niw2ICszMDEsMTMgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBnMTJhX3RvYWNvZGVjX21hdGNoX2RhdGEgc20xX3RvYWNvZGVjX21hdGNo
X2RhdGEgPSB7Cj4+ICAgICAgICAuZmllbGRfYmNsa19zZWwgPSBSRUdfRklFTEQoVE9BQ09ERUNf
Q1RSTDAsIDQsIDYpLAo+PiAgIH07Cj4+Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGcxMmFfdG9h
Y29kZWNfbWF0Y2hfZGF0YSBzNF90b2Fjb2RlY19tYXRjaF9kYXRhID0gewo+PiArICAgICAuY29t
cG9uZW50X2RydiAgPSAmczRfdG9hY29kZWNfY29tcG9uZW50X2RydiwKPj4gKyAgICAgLmZpZWxk
X2RhdF9zZWwgID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxOSwgMjApLAo+PiArICAgICAu
ZmllbGRfbHJjbGtfc2VsID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxMiwgMTQpLAo+PiAr
ICAgICAuZmllbGRfYmNsa19zZWwgPSBSRUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAsIDQsIDYpLAo+
PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGcxMmFfdG9h
Y29kZWNfb2ZfbWF0Y2hbXSA9IHsKPj4gICAgICAgIHsKPj4gICAgICAgICAgICAgICAgLmNvbXBh
dGlibGUgPSAiYW1sb2dpYyxnMTJhLXRvYWNvZGVjIiwKPj4gQEAgLTI4NSw2ICszMTcsMTAgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZzEyYV90b2Fjb2RlY19vZl9tYXRjaFtd
ID0gewo+PiAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHNtMS10b2Fjb2Rl
YyIsCj4+ICAgICAgICAgICAgICAgIC5kYXRhID0gJnNtMV90b2Fjb2RlY19tYXRjaF9kYXRhLAo+
PiAgICAgICAgfSwKPj4gKyAgICAgewo+PiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImFt
bG9naWMsczQtdG9hY29kZWMiLAo+PiArICAgICAgICAgICAgIC5kYXRhID0gJnM0X3RvYWNvZGVj
X21hdGNoX2RhdGEsCj4+ICsgICAgIH0sCj4+ICAgICAgICB7fQo+PiAgIH07Cj4+ICAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgZzEyYV90b2Fjb2RlY19vZl9tYXRjaCk7Cj4gLS0KPiBKZXJvbWUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
