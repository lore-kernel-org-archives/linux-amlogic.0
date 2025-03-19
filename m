Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D819C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oU6V35eNkCylEKwJ04ja1r3kj2aNxqJ8+uV/OQsu3Dg=; b=awR93U61UE1QOFAqIKnA+fDgY0
	QLd+SLbzFGj9uSEy19eRV75rgr1ZfFEldHyxPOk9dWGJKJxmqVlHhf2Yg4ebeRGzMOwsM+58NFhH6
	fnt1Yo5nrqNzviNDRRiaCMnWEoAHaFLgpOYaTF4tFzKCMezsE4aZpxPQY6WyUzN9qQtIy3V+5hOoJ
	X/MsQSb2KcgHRuL3zcj9YHACpm9iNGAMRPVlmq7dCu5j6NTf/UVfiL2/aIjJd2oj9eNlw6rQTV4Rm
	dTjVCMrs47I8yQ5fqkp2VHW72OLwkn9vTM+1Yzv7asaOlXnTBq9LmEBKTnGDeUU6YwhAQClFLsiRw
	YhYo+41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqOE-00000008cll-0q9E;
	Wed, 19 Mar 2025 10:11:10 +0000
Received: from mail-sg2apc01on2072a.outbound.protection.outlook.com ([2a01:111:f403:200f::72a] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqMW-00000008cZE-0rN5;
	Wed, 19 Mar 2025 10:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIxLrl5UNk6KpyP/izYuH2iJRFJ4na3qvFX/QT3GSLldVWjqk+/6GeDYd8vXC4OXxZDEf2DhV8aISVsxH6jID4Jurwn9GdurrGr+DKwdBx380GK1hmCQ+OQNzAckAUmN4+DLK8l/c5o7xGb/xzfqv7gosZB7Jh/tGf88+ui7lXHyVQJ9Y8IU9DDhq4sJwNNNCSpe0a5cYswHB3oLyqAeOdEPX6XA2QZI8pdo7Jg2YGznQK5P3jMFkl81bvq4VEPUhNc96d1iFUWcTD6KUwqycaYmLQEsfaD1BbgfOt4GiN3oDQDvZVlOfUbXMuWoISlx74WhzQXsxn6LvIdJ7v57jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4nmJGWACEX4QHrJ4YB55NqtCTr30uojMrDIBp0En4E=;
 b=GTXaE5LUwcQQ5EMQ1kId7EwQ4o3NQOMLi2D12O/5y0ZpOn6efpTxWc3kE1TCzWdTn3PAYOLm6S+jbbQwRsHymvtTtdtqkSJNCfhNaf49Q3H1ft0Y2lhTi9BfjSqIAcixCAbWrvC0wN1WAO+C6/9Exv8fJ/4oz4G0/EXriCKqPLYEv2kPrgQb7sUlS9E5/6QalnlmcnhINu9Ry/4AgkaUeMrDKFRZSvE+lvpMlTllK6Fm0vOJCzQj5sG35DAg/RTGQFnHgcoKwKVuDTvTQZmQxgvCW4qVrVgudCdMPbXO2R3V+qjWrBA4zEm0lvbR+FalYxUS5C+REeIUGXVxtvoMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4nmJGWACEX4QHrJ4YB55NqtCTr30uojMrDIBp0En4E=;
 b=kFi/Fb8XN5fVXQrb0H4wie2Y7ceT11SSTTClWpSxDVusA7myMEsLpFZYK/XvLDmmLGPr14ULvRINZeyBC9TWzE7FYszI6dWvhaa2uyW2yV61YzfL7a8CBDZjrgsOS/+hB8JSIbhGQkl/7TzB2SaERqFMRC3BFZY3bjKsIuIRsmtOJ6oFJO9/nR8+lnNEldl7HgOTist266dYj+8tmmN9IpzVTkUZka4F7S55OKji3YnaVZCn/f/wyHplERCBcJNZwYtydxz27S4jZOxtotkjfoFjibOtBH2FqYw7h20zbfcMqcZQ05/kvTGQffAAW+5bNfvSY2eoNVJH/Wpw+NQP8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB8029.apcprd03.prod.outlook.com (2603:1096:101:16e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 10:09:11 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 10:09:10 +0000
Message-ID: <9ae73d75-9c59-4255-8924-b456c86cbc01@amlogic.com>
Date: Wed, 19 Mar 2025 18:09:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
 <20250319-daffy-classy-kangaroo-023e1f@krzk-bin>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250319-daffy-classy-kangaroo-023e1f@krzk-bin>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb8e641-32c7-48a4-cfb4-08dd66ce17c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTFRVW1OakpTUWxhQlB1WmdoRzEyUmhKNlZ0bFdDL0RrSk05aDRRbnJkdDFU?=
 =?utf-8?B?SmdwS3BTN3NTRFNybmIvaXM4d2dDN0M2czJNNGdDRjV2SHByODhtZ2hFWmxE?=
 =?utf-8?B?TnRCU0xxU1IwbHg3Wmd1dWpycEdqMzlPOFcxeWt1RjhoMWFxK1cxUVRDVFFQ?=
 =?utf-8?B?bklrbDNkei8zOW8yeGZrTzYrMUhsd1BMMkgzWThFZWZZcmFJNTBQZmI3eklR?=
 =?utf-8?B?NUNjajUxdFp5NnlRT0VHUW4xZWxCbFk1NGhjSk1UdUJTWnozaVhhSDcrZlVr?=
 =?utf-8?B?bVZVbXl4QlNiMFFBb0M3SlBlWTNVL1BSMWc1bXJLNThPQXZPQ1NmR3Z0TlBD?=
 =?utf-8?B?NENpLzBnYmdiaERlT2p3RTFwL2ZSRnBNd1kxVTdScmRuM3pOc3BYZkxxMmxh?=
 =?utf-8?B?amVYUUNMVUxHV2N5SmM1d1V6YkdWSlBjWnRTSHBNUFVWY2V2TGRmV05kRlB0?=
 =?utf-8?B?N2Z1SHRpbSt5RmdMZnBPZTRIUXFUNXhpNHZXT1dKZWEzQlJ1QTB2WjlUQ1Nq?=
 =?utf-8?B?SVR5c2tnS3NyS1dEL1VGZU9oSE1WK3ZmSDh0MWUwa0oyNGNRTWJaZkU5OVFT?=
 =?utf-8?B?VzJYSVpVMkZTTCszODlBaDYzeHZwTHJlejZ3WFRTTlNsbXh4Vk5EcTdoR3Js?=
 =?utf-8?B?VXJ0Nzc1MDFaV1FBdjB2SnIxb1JyUnN1QTdGejg2OWZ0aXBibkJhczNlcDJB?=
 =?utf-8?B?SGIzTmdNUHBXRFRlMStUSUt2ckZoOXhISXMvc0pMc2ZFSXpPK3ZDaU45bWxK?=
 =?utf-8?B?eWN3YmxJc0UzV2xST3VucVNVczdyMEp4VUtSRU4rbUVkcmZXaFJqMzc4VmU3?=
 =?utf-8?B?MUJBSUJrb0oxSk5NK0xEUTZSaGtRaTdia2VaMUluMmtJSTk2bld3K3NDbVk0?=
 =?utf-8?B?UFdtOHFsSWgxOUswcERlVlFoKzN1WXpLRW5jYS9TZEZmbUVFWXF3RFFNN2wx?=
 =?utf-8?B?anA0MjlGVUVITjhac0lkcVFJTmh1RGF2OXBiUDhOUDlRN2pCS1NaZWVidkxz?=
 =?utf-8?B?emZQZDFSTXkwMEl4NnBnYXgwNVVaaDk0Y2ZsTUp1KzRLYmlZWFU4Unk1aVdu?=
 =?utf-8?B?WDk2aXFhaFJvUExFdlZYQk12dGFyVFlxRHlYRWxmSHpEUHJ5enZHMFlrN0xk?=
 =?utf-8?B?UGExbXhweDRHZmFYeDNMazRhUHplendXY2duY2ZxVW95bmcvRXljb2hkcWQy?=
 =?utf-8?B?VVI2bWFWZmhmUU5TbXRnbFFjYUtXbHNLNFJkeFJCVmY4Q0srb1hWbkZRdUNT?=
 =?utf-8?B?dFV4U3g5OWFySmx0eGErT1lQeFE0QXZBaUJNSjZBSERrQklaZmxqejhVVVBt?=
 =?utf-8?B?eVRhQ3JFTUVBTmg4S096MUlDRUJBQTk1UjdJaTVOcUI2OGM1VThFbDdoMUJZ?=
 =?utf-8?B?aC9LOHl0ZENFakU2a0hRc3NmV0wrVkFTSXpVVS9obkRla1lqUFgwSWhmbk1r?=
 =?utf-8?B?QTJtWlAvZjI2WlBvUjRwOUU0b3VmcThncXduWldOM25XT2ZHTThwQnVGd1pO?=
 =?utf-8?B?SVlsemY1b3hxTmJBa3pyOXJaR1V6TENMdDZZYXQ5V1l5UlJlSHZ6Rm1IQ2M2?=
 =?utf-8?B?eURoNVR0SHhIbzhwVUpxbWgxR2pDQzdiOEJKK0s4Q2ZsZTJVSlAzbmlNQzNJ?=
 =?utf-8?B?Z2U4bFd6VXBSMjNoRGliSi9RNWNHZ2NXa2owNGVDZmNhUTlhQk5iNjgxNzBI?=
 =?utf-8?B?WHM0Lyt0MmR3eHZIVWhhWm8vWXoyUEVQMFhVYU5BQTR1ZnhQOXJQcUltY3By?=
 =?utf-8?B?NUgxR05zNkZad09VMW5IMjF2aFdadXgrZU95SGxkT0llTWhQQ0N3bTV5OHRQ?=
 =?utf-8?B?ZHV3OU1TWndmTUdtRDY0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9Kb2oxcDJkYWxYOUQwRHJhdzZJZ2h2Zy9oalBJTXV2R1VOVkNNdU82akky?=
 =?utf-8?B?SWxPTkE4S2ZEcyszSXZaUDl5dHVBblJ1QmF2RTJBNUVkVWxBZTQ5QzBEQmR5?=
 =?utf-8?B?dGVtZWRVbG8vRzJKWUxkT21HejNNVWk0RVZ5QUovY2I5SDJIdVVRY3ZjNE9Q?=
 =?utf-8?B?Ny9YL3BvSVh6K0tHRmhYK05qQXlMQ1Nwc1dPbVFPdkVxdFc0ZFg2blVZNnVl?=
 =?utf-8?B?Snh0YzE3R1E2RTdnVXJqNUdZQlNxWmNqUUdWM3VsVkxqMHkzaEVOc1FHaFEw?=
 =?utf-8?B?ZlF1Ny9qS0JWUHRNK3ZDdnByRlV3Z1hHRWtoTWl0ZVA4cUhOQndhcXJSUjAw?=
 =?utf-8?B?d1JKMXd2Sm1zSlVHeU44VUs4cHQyWHkrVFU1ZWtjeVRFT056MnNqOUpubTBr?=
 =?utf-8?B?anEvMzlsdkx2N1Z1bDVPajlYWUMxK2Rma1V6U3BITWtGWXlDOUp2MzQ1aWVk?=
 =?utf-8?B?UlVGcC9TNnJhb0lnZEVxV2hkMEV0MFEwMkxzWmJPL3BhN2JrTGt2NktGYXdi?=
 =?utf-8?B?ZkoxTlBkSE1MbXAvQVRuaXdVRkltbzhPQ3ZneXlQTzB1b2hoS09tKzcxSzcv?=
 =?utf-8?B?eTBBVEtQRkUyS3BQbmZJZmtvb1ZHR28ra2Y0MElyQ1A0d3pHR0pyMURQWlp4?=
 =?utf-8?B?Nng4NzFvS0FBV2JTclpsbkFiWG42SHhjSGxieE5nTFdKKzU4bG5aLytQUDdu?=
 =?utf-8?B?cjRVaXVOdlc5cjBsWWxrbmd1bVluN1BKcEE5c2ZDZEV2dDVScGFHTk9DSDg1?=
 =?utf-8?B?bDdvMjhZanpYcHdmdU1BMkxYa2VQalUxMTRFYy9KME4wOU9TYmV2OWMwN2xC?=
 =?utf-8?B?czNtVGkyeFFaTkVCL21Jd0JwUEhtVEhJSzhTU1gwRFVlbVhKYlhKQ1JwaC9J?=
 =?utf-8?B?L3NNQUR1MGJ3YmdDQ3JwZEdkRGQ5Q2t5UmVMNFdaamtrMVVQRDhWa0JRMXhO?=
 =?utf-8?B?d0dNNklUOFV2NXZkVmdSZ1dGVWRCWE01cXV3d3ArOGJ2ampnRnd4Y1BxUWgz?=
 =?utf-8?B?ZldwckVNMzhha2pXOHNKTnM0YUdNWnU5TFBScW5pMWtpaHFqdFVDZ3dSNlZq?=
 =?utf-8?B?QVNDb1FpVmM0aGdTMGJMRkliNWRwVlV5ejRLRlFiYVJ4SDM1NmxFN0FTTW1L?=
 =?utf-8?B?MmYwWFlPdWdmak5wZ09kakMrcXliRmZ4S0JCdzRyemtmQ1FqYkpFUFdybWhL?=
 =?utf-8?B?NER3NUZsK1VUVEtEQlBBMExyVkkzZy8zaVNTY2tlUzYyRUx5WjJIWGpiRzFi?=
 =?utf-8?B?dGNzMGkyYVB0aVdQelB6UzAvNURTaTBibkZZZTdBSTBOY250TWxnRlZHK09p?=
 =?utf-8?B?QnpiUG5QZlVXeWNuem16R21YTzAvcy9tQVJKVW1acUU2c0dRSXZWMzM2R2hN?=
 =?utf-8?B?TnFJQlVHQ1lpTU4zSy9nOFRNTE0vYzJLbFJpRFU2cGpQOUlidUVRMGdiZzM4?=
 =?utf-8?B?eHMwWEgwbG00cTd5b2VOVlFIZWVkdStYOVY0VTB3WXRwVWFzSWpOd3hFZVpY?=
 =?utf-8?B?eXMyYUNHUmFqVjBRUDFZVUN3N09Rc1JVVFFueHBzQzV4am9LdndZZFNsYkRB?=
 =?utf-8?B?dmRWSU9CNTUxdW93djlhUDZvVjBJeUJPUVZHU20walg3emV1YjVQN0JnM2pn?=
 =?utf-8?B?ZDRVMnBmRWZMTWlvY05seEk0YkltNTI1V3NoYXFjSytLeVlFWlFubjN6YVpl?=
 =?utf-8?B?ajk1ektzWTFJNDBqZUlCeTJYRUwzTU1sOEF4T2hvZ3NubzdaenFMcWVTb0F2?=
 =?utf-8?B?SGJGQWdBQStCTlA0ZFBCclNqM2QvUjEzaEZsY0FWSWx2SWw2TmFTVUdYVFZS?=
 =?utf-8?B?ZlFRak9qN05FWDdZekVtMllhclpxcVNXNHNwczJrRHVmSDQzbktpL3JMczVv?=
 =?utf-8?B?azVQSWFMZjYvMWZkYktEeWVEYkZBQndYVkFQMVY1QzV1NVNYK0dJQXdJUWc5?=
 =?utf-8?B?U1VoOTJVempCZGVURVRtSnZOd09iaUpQaWhlR3pUd1d1dGMzSjUyTndEVE9F?=
 =?utf-8?B?MFFhRUtjUWJOTzdHSGl4bVlJNWhlVXdiM2tFemh1MWNoRVRwbTE1K1RzN3ZY?=
 =?utf-8?B?VjFjOUdvdjNSMGNmQVJmajlCcWt2enRqLzk4QUlLcnJwSXYzdHBNZnFyNFR2?=
 =?utf-8?B?M1VtaTQ1clloUFRycmhDd3prSFNFaHNyWWpKSFZEbHZ2QjFLYmg1cDBJZXJs?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb8e641-32c7-48a4-cfb4-08dd66ce17c7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 10:09:10.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esMccDRfjIzI4wsautN8OP7bH/b078WZD2vi22hOrykQ21XpqyQ/X6A/x/C8tEg5PfHolF0KTnxTvkZsJaAnKsiNNiiJ5favpM8uEJhWTpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_030924_264086_AFCE8102 
X-CRM114-Status: GOOD (  21.11  )
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

CuWcqCAyMDI1LzMvMTkgMTY6MjIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20ga3J6a0BrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhp
cyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uIF0KPgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gV2VkLCBNYXIgMTksIDIwMjUg
YXQgMDM6MDQ6NDVQTSArMDgwMCwgamllYmluZyBjaGVuIHdyb3RlOgo+PiBBZGQgY2xvY2sgSURz
IGZvciB0aGUgbWNsayBwYWRzIGZvdW5kIG9uIHM0IFNvQ3MKPj4KPj4gU2lnbmVkLW9mZi1ieTog
amllYmluZyBjaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIGluY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svYXhnLWF1ZGlvLWNsa2MuaCB8IDExICsrKysrKysrKysrCj4g
VGhpcyBiZWxvbmdzIHRvIHRoZSBiaW5kaW5nIHBhdGNoLCB1c3VhbGx5Lgo+Cj4gQW55d2F5IC0g
ZG8gbm90IGFzayB1cyB0byBkbyB0aGUgd29yayB0d2ljZS4KPgo+IDxmb3JtIGxldHRlcj4KPiBU
aGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPgo+
IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0Lgo+
Cj4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9jZXNzLCBoZXJlIGlzIGEgc2hvcnQgZXhwbGFu
YXRpb246Cj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieS9UZXN0ZWQtYnkgdGFncyB3
aGVuIHBvc3RpbmcgbmV3Cj4gdmVyc2lvbnMgb2YgcGF0Y2hzZXQsIHVuZGVyIG9yIGFib3ZlIHlv
dXIgU2lnbmVkLW9mZi1ieSB0YWcsIHVubGVzcwo+IHBhdGNoIGNoYW5nZWQgc2lnbmlmaWNhbnRs
eSAoZS5nLiBuZXcgcHJvcGVydGllcyBhZGRlZCB0byB0aGUgRFQKPiBiaW5kaW5ncykuIFRhZyBp
cyAicmVjZWl2ZWQiLCB3aGVuIHByb3ZpZGVkIGluIGEgbWVzc2FnZSByZXBsaWVkIHRvIHlvdQo+
IG9uIHRoZSBtYWlsaW5nIGxpc3QuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZl
ciwgdGhlcmUncyBubwo+IG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUg
dGFncy4gVGhlIHVwc3RyZWFtIG1haW50YWluZXIKPiB3aWxsIGRvIHRoYXQgZm9yIHRhZ3MgcmVj
ZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4KPgo+IFBsZWFzZSByZWFkOgo+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjMy9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDU3Nwo+Cj4gSWYgYSB0YWcgd2FzIG5v
dCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCj4g
PC9mb3JtIGxldHRlcj4KCnRoYW5rcyBmb3IgeW91ciByZW1pbmQKCj4gQmVzdCByZWdhcmRzLAo+
IEtyenlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
