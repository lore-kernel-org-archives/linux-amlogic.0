Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1112AEF48DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hl4/H168inYbBBon9my7qmWODU+IaxKL8d5k+uwr2TI=; b=pUzY3fR9wkOSEZG6DJUpaS5b3p
	YRSB+yxABrW5+0uavr8nCU3nVvEhF3RvM58oxjYtgtOCRsqOXNrkMvOSSa1Ew9zmQfJzpwgW969PA
	vAnGLBUbfZYkxN9cCdkLFdF+FNUP1iG9XaZhu/inLa/WsIHL2ZZ7omLLnX3Rt8cvLOuxdZlwk3M/W
	mv/5t3aaTgyr2Ci5zWfbsip+L95mPbS0B8ZXEYbb3EGWzo+4ZgOn+uwQkvgrsYjmqyLKj6RFqVnue
	PofYlRGVc7cEVK7ZVX36qsvpkLHfZk2RuOWVMAfQwul/3vi+RdpbdlkEnRTGlZmTKlLNr/icktxxP
	hHncm2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoAe-000000038c5-01qs;
	Fri, 13 Feb 2026 08:05:00 +0000
Received: from mail-japaneastazon11022085.outbound.protection.outlook.com ([52.101.126.85] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoAa-000000038bX-3R0R;
	Fri, 13 Feb 2026 08:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBNNc8nJmBw47A/OZM4CwHpLnsGiK61N9NaWCXd3qpJbPl+WbeUG8KnUN728f5Hxv59ZZCQdAeK+Y1WYmJpKWD3/fJ6o1fwUhFaGhkAUWcibZ0Mdbc0z3HE+6Bl8vdftSaM4EjsEpwwiGGqa5fUBPJ66dtXa17BT5ZLiCCGm5ttv9Q6EJBmhrmHCd0pu6BqbZ//jZ33CfNlmu8fd2ChwQc8T1+qsSHc2xbQTkuZfJU7ODudDo/5Hwr40YRkrUA6eKTmoFm61FXJ9lWGB/m5T7ZkqCfGdYOA3NzeEaZNKAD5Sb7/4aXL982zHu1P13aC+ldUvPrJoyETOWXwT61bCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZmwKAJvmnP0kkVIQtzPnIsLb1mF9IK9U3BovZEA6JM=;
 b=oYLDOuoAnUh0JhFDdMyiJDeDnyTFPqNiyN1ZIF087wPLwtr46jSLd6ZEofLMvyqSZVMrs+RSOceRJCSqjFYxBkunZDxkv6mbaWku1h0+oy6bmQ+WZtrBI5UgifeZLZExZPPPpBfVi3C/r5SQpcGfXQvIGvi/LeW71iuCnhxWRiBfLrzGHmXMn3MeblrPxNIo9GKo32cEmPd+UQlM0tTDBab0kHPjLsFeeAQtviBlYkI93iGrvr6nBhe2Wjywsyx33ecPyZQVBtAIQApfPuTNNlRC+qbBxJrwEtFCQYyt8B3NUrdyMzvRb9XJNkEuODXm+ojntEmCe+jPLRWQJA+1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZmwKAJvmnP0kkVIQtzPnIsLb1mF9IK9U3BovZEA6JM=;
 b=xa8lPT3QXRRmWGjUncvAWyIzHzRbjBO/M6bsOjPMDL3U5KXcg2G1s99Sc9rdf/+iygu/Nw2+lke/X9P4mAxTKnIunSnAzeL/FdTHbza39NXEsIpHGsFb/GWl+qdUnrlIfm0SZ2hH7vgg5ICWyczWjOr93ckxASLIlHu7U/c2MPYbNmpWETA+GLVfYag2QQN5ey18LCzf/oIGsZD9mkvd9C4qGGi+XsAr3ptmHMY2O63+ZE8itMRSrblSiqWNCGee9hhsD48IKr7yjplwqXViVhpXYvLvGeqR94fzUfh+lvq0meaYcoMVHvhQ12DgSYhG7WVaaIF+ZU9meirVbywi4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KUZPR03MB9568.apcprd03.prod.outlook.com (2603:1096:d10:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:04:48 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:04:48 +0000
Message-ID: <fd56ede0-5d62-42ec-8d19-19552b246c7c@amlogic.com>
Date: Fri, 13 Feb 2026 16:04:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KUZPR03MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: dba7c2c6-e8c7-4198-6cf3-08de6ad68e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0dydmM2V0Z1WVRGYkd3V2hWSEdWbGpyUHBEN05ETVl4Rm11YjVIYnpwNmlP?=
 =?utf-8?B?S1RIbTdUQmVYbmlBZS9VRkdESi92b0pDSkFiMzJnU3VEZzdxaitzdmduajdy?=
 =?utf-8?B?RWlTQWJDd1ZpaFA0Y1k3c0NCRmJYdStKUXNickFEbGd5TU11RU44RlpmRGJr?=
 =?utf-8?B?RmwzZmEzKzMzU0J4SHVEbERqME8yUTMycUplNG8vNFVxVUFmZHNWODVrMW9E?=
 =?utf-8?B?OGYwdHEzQnd2QUh0MGVEZnJjQVRNVktXcHVHMjJNbmpnMk81UFVqNVdUQkVk?=
 =?utf-8?B?YThxTjdZM3d3b3VEbUU2b1JIVFM5U0oyeDdOQnlvamhOREovQVp1ZjhmYkJr?=
 =?utf-8?B?SENxa2plclNmRk1pRzJDenhDMzVFWU9rTHhvMWtpR2xEZDh4dExza0U2NkdI?=
 =?utf-8?B?NVhwVHZFUTJSbVZmMHJhU2xyWW96VDJ4dFJwOXV4N051WjZHNWhWRzlVVlMz?=
 =?utf-8?B?ZzRaejJKSUFpWnFNUk1Gd056blBvU080YVI3NDlQdEF1cjU3YXNxS3VzK2l3?=
 =?utf-8?B?TExCUjZWNzd3RExSKy9Eak9KOHcwRzhXeGpUVDFRdW0xMTJ6MzZIZ0Z1VmUy?=
 =?utf-8?B?Si9CVWRLd2crNnNnRmJIdWEvS21sQ0JCUGw1cjVwTE1PVEowaDVvNzU0NHJq?=
 =?utf-8?B?UmJIL0JiQVMzdC9nQTdGRjJFUXFJa0wrVitUdS9iYmcyakRCeTk5WUdCRTl1?=
 =?utf-8?B?b3B2Vk9YTlI2YjFEZFNiSVdCMGdlQ2JSM1kvTi8rcitYVlVsUXltWDNIdjhr?=
 =?utf-8?B?eFdFRGV4RTV1OHNEZEw3bEVTdWQ0cFl4cGFaUHBXdXJqZ2hGMys4VW5TNTcx?=
 =?utf-8?B?cWxiMEUvalkzRmJ6UjI1UVcwcWR5WVNzOGdFWDQ1Z3FoZjQxc3VYdFVTK1Y0?=
 =?utf-8?B?K1FrY0ZBV3R0T3g3N2x4TSt5NXBxby8ydDd3VXlqeVlSZDdBbFhNOGppUWRI?=
 =?utf-8?B?dSs3NTlGUS9ndTAwUS9xcWlRNFhkV2VndmF1YWdWMXlPdVdGbFI5WFlVM2Y0?=
 =?utf-8?B?YUJKV3JmZHpPTitIbmg4cjBmY2gyYU9lRTBIZURoSkMvTitmR3E4Qm1aa1V4?=
 =?utf-8?B?T2ZPdWRHM3dsVHJqYTA2U3JGWEovWklWWmhPaHQ1dWVZMXpoeGFUQTVyNDhC?=
 =?utf-8?B?RFNweTBwazVJejN0czJMeFpBN0Q4cFlXWnY4UVJ6NWZqOVJmaVROc0ozdE41?=
 =?utf-8?B?UzhPVXRkT05mR0pwVjlLQU9POGxRK1ZTMDFxZVRiTk9VOWVJZ3lGTnFTMUow?=
 =?utf-8?B?anNmUmpTL0V2L0E0aTQzTlpkd2ttRVh0NmdNN3R1MWh0MmJEUFRqWG5YSm1I?=
 =?utf-8?B?S0hWb3FwUmlWYWJTVUYrMjk4MzlnbkdZVDV1WTVhZjN2RHluUUc5QTdTWWpH?=
 =?utf-8?B?c1lpeU5JWUI3MlN4bzFNOFBDdFQ0NE5Kczh2R0dsM09aRFN2cTlVemovRGhO?=
 =?utf-8?B?Zzg5bEdrM3o0ZEpnMTN6dzI5YmZYMjI5eUZOeURna1l2T0F0RmlBWFNESWN3?=
 =?utf-8?B?T2FDV1pJeEIya2ZTVGM1b284NnBENGpQUEJIV2JjLytUNWh6M2ZLWWZ0Q0g3?=
 =?utf-8?B?dEhwYnhVVDFQYkQvdXZjNTBnTWFnVlBpTXdub2lDbFpyVHBWb1l1RVZNd1Nm?=
 =?utf-8?B?U2FzLzNKQm9mOG81cnJUckREa1BMamxhWk9EVEVEYWJremdvdHNhY2pWallC?=
 =?utf-8?B?eXRwaFcxaG56K01tdTBxZkNiVktyaUd1M2JQSVB6dEd1WllrcTNLbzE5eDhS?=
 =?utf-8?B?Mkg1Z3RSYUQ2enRWUUVHQWRPdXlDWDFJMzJUUHRoK0d2UlJsa05DVlZyc3hx?=
 =?utf-8?B?SDhwMk1ITWhnMEdLRFhJWjZ4ZjlpQjA3MVV3N1F4dzVDTWhELzFqOXdQdENk?=
 =?utf-8?B?Y0FEZjZQaW00K1d0OTBRRHdTQi8rS2UyKzJGTjY3UWRza2wvRnZRbHNGSm00?=
 =?utf-8?B?SHdSdlJEQVRVZlAwSW9wMXEwakdGUWFpdFpFdnlLMHlXNjFadTd5WHMrSGlk?=
 =?utf-8?B?K1AxMkVFMjRwL1Q4aGtkN0dNenVrTzVKZUgxdFIzVURvRGRLWEhDUVlLTWhz?=
 =?utf-8?B?WmZ5dWl3TFVwN3E1YVJjQW9ia2Y3RjlnSnArOWt3MjN6K0xCaWNydERzU3V5?=
 =?utf-8?Q?qaIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVRwNUV6anRCSmcxVjkvZUpvdDhuMG1UVitlQUNrTTZieG9ncVMwR2M1SGF4?=
 =?utf-8?B?SFRkNGNQWElvOG5XS2Y4UnpsSUJ6bjd4dngxYUNNYWh1M3lhdTErMmhiR1pr?=
 =?utf-8?B?cEpUYUE3TWVtMXo1dTUvQWtxL2gvSys5TVV6RGZMMzlVbzNvaTl4VCtyLzB1?=
 =?utf-8?B?MEViSVFacThrenFEZDhrL1NSNGEvU2lsV09IWitBM29QbjZ5OXR1S2VGYzRG?=
 =?utf-8?B?MGpCSmpMVVJ5cERRSVcxcm5NYkx0QnZXSWh2YnJzaXo0bkorN01TM0xjMDQw?=
 =?utf-8?B?YWVpMXNaT21jeVpyVmF0THdIMXhGZDN6ZVgrV3pldll2S0dDR0xKa0lWcXNt?=
 =?utf-8?B?VzUwWkRhKzZUMTVqWGVLNkFsUCtSSXZBamxkVjhkdzRCRlI4OVFxcXYxalow?=
 =?utf-8?B?Z0FaNmpXNkx3S296Y0ZBNDFJZVowcDJNSmFxeUJFYmFka1FQMnRwZVZUa29C?=
 =?utf-8?B?ZGYrMnhSc3NUMGZBajJDdHpPM0hFbjVVSTBWWXFRZ0dlVXlDbk50R1k5OUx2?=
 =?utf-8?B?aWNXUEtjaTZMTFNXY0ZOazlZZDNJNktwZ2ZpMXQ4Yzc3OEV4ZEpMQmw3elQw?=
 =?utf-8?B?emtiRHBzUFh1ZHBYVGR4QXIxNFNnWFk0MlVCTmVuRVpKZGRYRTJsRE1ER3Qx?=
 =?utf-8?B?ZXp4Wms1WVUvU3dBdFFEZnpSSGlNdDd4TDFJMlNmNitxSXlBRzUrSUdvNXli?=
 =?utf-8?B?R3FvZ0hwWFRGMGQxSUN6bEN5aXhrOW12YTFsRG5pRmxNbXM2U294ZDZvOW5J?=
 =?utf-8?B?SVRUaldIamtOeUVlRTVuTUlxTEVXN3QrODBPZmJYTnVhYzNyUmZVclU3SmhS?=
 =?utf-8?B?UjY3RjM4T3g1TEszNUR5cUorSzdzdGdURUhMWURiMWtCQ3JsYzV5emVvYitE?=
 =?utf-8?B?c1RBYlFEeUxKRXhEUXFrMHVsK3ljSUh2UEhqbE9yOTg2NXdlbWlrOHJEZHgw?=
 =?utf-8?B?ZFlhL3AyVTIvQUxPWU9jcGZrN1FkRHdXTm0zZFo4SnBQbVd0WThBcGNLWjNu?=
 =?utf-8?B?MkI1UE4yUEU5VjI3cWVFSzdXc1JsUGNOTkprV3NEWmRvTEIwT0lHU3hCSEhx?=
 =?utf-8?B?eWNaMFF5QUkxaUVwdkR0eXUwNWhyRnh6cmFPV3FENVRLTko4eDZvVW95WUlI?=
 =?utf-8?B?enpZdVRlWlpVZXdKRStyZGlwdytnbzNEYkIzYVViS2dyQ1pPaTA3U2d0K05s?=
 =?utf-8?B?ZGlJbFJlR09UQ0lXRHVUUUxWQWNSanA2aks0NkRxM2EvNGxvQ0Z5T2N4UnJu?=
 =?utf-8?B?enQ1bndYdjBsQnZ5MFF2em4zNVlKSXY5WjJQdFJMVklwZ2VEUFZUUUlhbmlv?=
 =?utf-8?B?VkVBWDVIaDVtWVVhejcrUlBhbHRHUnlBYit3Kzl5bjk3TmduOEhXMElpaGdh?=
 =?utf-8?B?bWtWSFNFbHZ0dXNaSE8yaWljbmFjOUszV3Y5WHNnTzN6TVo3NHlEbTNveXFt?=
 =?utf-8?B?Tm9wWCtCaUl6OEpYK2tVdHhtYjB2Q29YVzlBVHFrZUdoSjNMVVZGOXJteE5F?=
 =?utf-8?B?M3N5MndwVXF3aTNsTzU2SXdsa1VMcG8rbHNyZ3NpcWxVS1pRRG9jM2IrVGx0?=
 =?utf-8?B?L1YrS3hhMTVXWklpeW1BajVmaTRMRmd1Smw2Qy81bSt2V0I4QmJ0blZsT1hj?=
 =?utf-8?B?cFZ1NjR1bXFQVTlkdHVnTlpPWjlITStLUWxMOEpTOElxTklGVlliOFpKVUI3?=
 =?utf-8?B?d0llYmEwU3Rqc1p0c3V0eGF2MFIzYm5WQnJQYzZwWWxMaGxJdmhCSHNTY1l0?=
 =?utf-8?B?RlBkdTNNekNUb3RIMEtHM2FtK3Z4U2dmcmlaNHJid0NST1NpMUFkOXRwS0l6?=
 =?utf-8?B?TlY0ODhqaVp2L0dtOUVXakZaRmpEL3c0UWhsazg5Rkg2dFpzWDBqV3JJcXpC?=
 =?utf-8?B?dHR2ejJxVE5hdmVqcit5czZHc1FtUXNyL0dUbG0yZjRCSVhMSnFEMUdVeEw2?=
 =?utf-8?B?TG14MHdxcExzS1hDYlpFZzR0eUJmQWE4SlRMcGhLSEg1dk5kYkI4aVNyK3VX?=
 =?utf-8?B?Kzg1R2V3eTdoUjE1MWhrUmgyUGk2dWwyYjRSa2JVUDljak9TYktyRkwvR2Ur?=
 =?utf-8?B?dkFzZUhtMTlkZi93QlA0ZVZpRHVrRDlsTHFzS1ZMY0xwQmk3Y01oK2RsS1Yr?=
 =?utf-8?B?d3RJMEkwWVZpVCtaeXY5dDRWcUJwdnFFUlV2MlZ3dW5PZXdLYzBnZURhUnVC?=
 =?utf-8?B?aFRWNzgwcGV6Z1RjTTA3TElmYTBILy96OVFBdW5DS0lycUU5ZSsvMnFpSm1L?=
 =?utf-8?B?eWUyZWlIOVVWM2d4STlwMU8zd09DWmdEQXJBWUF1ZnkxcHpoTkcvSS9nQU4r?=
 =?utf-8?B?TzNOQnFlWER0em5XbWRJaTJFRDRvaXlYeEllVzFHa1dsVVFSSnRCQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba7c2c6-e8c7-4198-6cf3-08de6ad68e78
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:04:48.0443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/D23GDokwLqDWFhhXguvS+2HfFc5JMFo4LpZ3X/84IoR2unTDhDY0Cd81EexyspKRPiFcxwKm45kIhPegg/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_000456_881996_3EA483F4 
X-CRM114-Status: GOOD (  16.21  )
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

CuWcqCAyMDI2LzIvMTMgMTU6MzUsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+Cj4gT24gMTMvMDIvMjAyNiAwNjoxMiwgWmhlbnRhbyBHdW8gdmlhIEI0
IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5j
b20+Cj4+Cj4+IERlc2NyaWJlIHRoZSBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBWNEwyIHN0YXRl
bGVzcyB2aWRlbyBkZWNvZGVyCj4+IGRyaXZlciB1c2VkIHdpdGggdGhlIEFtbG9naWMgUzQgKFM4
MDVYMikgcGxhdGZvcm0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW50YW8gR3VvIDx6aGVudGFv
Lmd1b0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL21lZGlhL2FtbG9naWMs
czQtdmNvZGVjLWRlYy55YW1sICAgICAgfCA5NiArKysrKysrKysrKysrKysrKysrKysrCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZjb2RlYy1kZWMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0
LXZjb2RlYy1kZWMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjg4NzgwNTE0ZDA2Ywo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZjb2RlYy1kZWMueWFtbAo+
PiBAQCAtMCwwICsxLDk2IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4gKyMgQ29weXJpZ2h0IChDKSAyMDI1IEFtbG9naWMs
IEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZAo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVj
LnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEFtbG9naWMgVmlkZW8gRGVjb2RlIEFjY2VsZXJhdG9y
Cj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0Bh
bWxvZ2ljLmNvbT4KPj4gKwo+PiArZGVzY3JpcHRpb246Cj4+ICsgIFRoZSBWaWRlbyBEZWNvZGVy
IEFjY2VsZXJhdG9yIHByZXNlbnQgb24gQW1sb2dpYyBTT0NzLgo+PiArICBJdCBzdXBwb3J0cyBz
dGF0ZWxlc3MgaDI2NCBkZWNvZGluZy4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0
aWJsZToKPj4gKyAgICBjb25zdDogYW1sb2dpYyxzNC12Y29kZWMtZGVjCj4gV2h5IGRvIHlvdSBy
ZXBlYXQgImRlYyIgdHdpY2U/IGNvZGVjIG1lYW5zIGRlY29kZXIsIHNvIHdoYXQgaXMgdGhlIGxh
c3QKPiAiZGVjIiBhYm91dD8KSW4gZmFjdCwgY29kZWMgbWVhbnMgZW5jb2RlcitkZWNvZGVyLCBh
bmQgZGVjIGlzIHNob3J0IGZvciBkZWNvZGVyLgo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJ
dGVtczogMgo+PiArCj4+ICsgIHJlZy1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0g
Y29uc3Q6IGRvcwo+PiArICAgICAgLSBjb25zdDogZG1jCj4+ICsKPj4gKyAgaW50ZXJydXB0czoK
Pj4gKyAgICBtYXhJdGVtczogMwo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBtYXhJdGVtczog
Mwo+PiArCj4+ICsgIGNsb2NrLW5hbWVzOgo+PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBjb25z
dDogdmRlYwo+PiArICAgICAgLSBjb25zdDogY2xrX3ZkZWNfbXV4Cj4+ICsgICAgICAtIGNvbnN0
OiBjbGtfaGV2Y2ZfbXV4Cj4gTmFtZSB0aGVtIGJhc2VkIG9uIHRoZWlyIHJvbGUvbmFtZSBpbiB0
aGlzIGRldmljZS4gV2h5IHRoaXMgZGV2aWNlIHdvdWxkCj4gY2FyZSB0aGF0IGl0IHJlY2VpdmVz
IGEgbXV4PyBOb3QgYSBkaXY/IG9yIG5vdCBhIGdhdGU/Ck9rLCBwcmV2aW91c2x5IHdlIG92ZXJs
b29rZWQgdGhpcy4gV2Ugd2lsbCBpbXByb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4+ICsK
Pj4gKyAgcG93ZXItZG9tYWluczoKPj4gKyAgICBtYXhJdGVtczogMgo+PiArCj4+ICsgIHBvd2Vy
LWRvbWFpbi1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IHZkZWMKPj4g
KyAgICAgIC0gY29uc3Q6IGhldmMKPj4gKwo+PiArICByZXNldHM6Cj4+ICsgICAgbWF4SXRlbXM6
IDEKPj4gKwo+PiArICBhbWxvZ2ljLGNhbnZhczoKPj4gKyAgICBkZXNjcmlwdGlvbjogc2hvdWxk
IHBvaW50IHRvIGEgY2FudmFzIHByb3ZpZGVyIG5vZGUKPiBXaHk/IFdoYXQgZm9yPwo+Cj4gV2hh
dCBpcyBjYW52YXMgcHJvdmlkZXI/CgpUaGUgY2FudmFzIHByb3ZpZGVyIGlzOiBkcml2ZXJzL3Nv
Yy9hbWxvZ2ljL21lc29uLWNhbnZhcy5jCgpJbiBzaG9ydCwgY2FudmFzIGlzIGEgaGFyZHdhcmUg
SVAgaW5zaWRlIHRoZSBBbWxvZ2ljIFNvQy4gVGhlIGRlY29kZXIgSVAgCm5lZWRzIHRvIGFjY2Vz
cyBERFIgdGhyb3VnaCBjYW52YXMgSVAsIHNvIHdlIG5lZWQgdG8gcmVmZXJlbmNlIHRoZSAKY2Fu
dmFzIGRyaXZlci4KCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvcGhhbmRsZQo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0g
cmVnCj4+ICsgIC0gcmVnLW5hbWVzCj4+ICsgIC0gaW50ZXJydXB0cwo+PiArICAtIGNsb2Nrcwo+
PiArICAtIGNsb2NrLW5hbWVzCj4+ICsgIC0gcG93ZXItZG9tYWlucwo+PiArICAtIHBvd2VyLWRv
bWFpbi1uYW1lcwo+PiArCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKQlJzCgpaaGVudGFv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
