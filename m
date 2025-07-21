Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD9C87FC5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jul 2025 02:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXjE/CE7nTF/ejIhnquBy48sQZWtJgnNb/D/Dwor37Y=; b=eDGl+PMjaEWbPKtWxOJ6O/NnJ0
	jU45kfqxjF0X/JwM6dv0+mi9zXNj6IfcPiSDHCw59fi3qWWyHL4a+q/GHUAcIdFC5eie5flvH6lIu
	/Bq5gM0GWgA8XTfUYix1M6PupZN9gPudtgd/btoeWWupGV8bX4jlnUfOngRjaTPnYsKppHxGni/MN
	XpS0Vy0N9pkk/tqmrYS0wHKQHDkrLXB8IMOv3dNfMgmaz5f7XjjZWNF6Zr24Hj4MoGOp5lEq+UK5k
	ADennrtrJUlP0f4k1Dz0szGzt9po5wvXfFqlrH2mK1ZSG3aYmkdeCr2UYaWp1U2LuJwp6P6CwvbhY
	ShvVX16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgHF-0000000G0Dk-2pvY;
	Mon, 21 Jul 2025 02:29:17 +0000
Received: from mail-japanwestazon11022127.outbound.protection.outlook.com ([40.107.75.127] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgGV-0000000G02m-39f8
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Jul 2025 02:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIyBM1cTBlDwY+jWBeX4Wnz3v8yHxQX9xoAFN4Am3z6CD/Mxb8YqBVdE5p1uSv0MwoEUnxCpEI5FQL0qFlZxgA+8IkhcAmSbQPXtDWAv/ajFrQ1a6v6oWDD3B8BlmdW1gQO9gJGBYnC0wy8oZ3QujaneJsCR9ETkZgq7Yjd0GXSnuKQNv6H9dyDmxl30jDqoQXwruytXXXDRm6c0IC84mAS8uJGELczvC8WqQoSjKt0xIQtlu9OekIvB7amr5/xcuVcZ3yNqrxqL7oCZqDE0OjEZcoiyQ0zuEOipJAjrUcVY3YJoS5Wz2ulbb8qBunQ88rtV1dnTDRPFqE7r7EBlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYH4kx3pqi0RsMUCtoFHf1q/ZiBPvz6JfjS1VjQh/Nw=;
 b=V1yZ9kPTGw8lDIqDinA7QyxIopzOBq25pzD8wAjy53erlSi8SVSdFhP3DpwTuKmCfGYLUtPVrfoMHlP2A9/YNUFWGN/do9qEfmB5nJCSh1wNWbc6pgBJmM6PlJfi3tTj5FW6P1fHm6rnXN9WDux2QJgpHbuQAmaaEi1LID17jiUsVZazP3Yzlmc0hK8w6Sjb2yUa4Mxl6WW12tpBA1ZPSt11T1d8ujWSExIx3G1bNbV2gEAjPTNPQK33RGip4lYtMP/nFs7YIyYlqlIu4I1iuMOSpt+Ty1loBSuJkIgFFkAWnV2S8tCoBXSG2p79EoaU0xc8FOhV1gvFowMLm621pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYH4kx3pqi0RsMUCtoFHf1q/ZiBPvz6JfjS1VjQh/Nw=;
 b=pdUD80erk5Yb9kIo0ujDm8FkcTGg9mp4EywS0U4JvHsLcgrHCyZyV6FwIn6Z5hqqlghFrHGNy9C9AuYXjJGLaxds5nZVSMmit+MZFJuPsV+2Jmga5ZurCZMRNExDjF3yVojuN/UqV3Q9mB+dpjKxVh/uTX40A9HwJsxsQTL+5H8i6Mckup7+lk0UlqHa8qYDUTSN9i7vYdfrsXfxOSUWG88H6P5HSGUWDSehv5sJs4WXAsejDKFRBoYhFg1FU0wgcLtjSglkLXqK6AHjRVxLnWF/d1X2d7/2Fstt62ajO/ExS3BIiH4OkSSzLdiUWfcra2bbGdtec15HkgEy+myC8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SI2PR03MB6461.apcprd03.prod.outlook.com (2603:1096:4:1a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Mon, 21 Jul
 2025 02:27:55 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 02:27:55 +0000
Message-ID: <f4037828-be67-4312-b6c5-d3b82a0876f5@amlogic.com>
Date: Mon, 21 Jul 2025 10:27:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: amlogic-a4: Optimize global variables
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yiting Deng <yiting.deng@amlogic.com>
References: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
 <045fc0c4-417b-4fd5-8bcf-7c7c34fdb01e@web.de>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <045fc0c4-417b-4fd5-8bcf-7c7c34fdb01e@web.de>
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SI2PR03MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: e28ecd81-0767-4ee7-e175-08ddc7fe3326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0k3ZHFxU0J4bFV1cGJKNmxDMDIwc2tNZkFJM3pLbTFXZUtkLzQyb1cyUyto?=
 =?utf-8?B?bWFXVVY2RVhYMzcvOTlZMXdGbXhyWlIyL0ovMWRyZzJvYm8yL2UyL2ZsMlk2?=
 =?utf-8?B?VzlGRGxiOHJhOWExSitSOXgycElMNTR4VytZMlgzWnhKQ0lyRFBOc2tmeHkr?=
 =?utf-8?B?aHU2akhPRGp1WmNscHlGRmkweEMrWXJOV2FWTEtLZ3ZnYXhTa0JLdjAxeWI5?=
 =?utf-8?B?eU1MWmNlT2EzTGlUb29sTDR1Z25nWmdzdFZkR0IrdXRoRUc5b3RVdXJ6RGtq?=
 =?utf-8?B?Z01XaWVPaFVIdkttTU5CNDFwbHdlYkJXOWc3YTc5cm1RU2U2NS9YcWtNb001?=
 =?utf-8?B?MzhwazRqMXZCazBuVkRDdG5vUFllYWZyc0gyN2VRaTJuRHpaUEpRT3lLcith?=
 =?utf-8?B?WE8xNDJ4bHc4TWo3TXJoVDA1Q29xT053VUpSejRmNVhLL29FYUxqcUFVR1ZI?=
 =?utf-8?B?OFVHdTRmeHZYb24vQnVIcGhYOUFSME1rc3VrMmlhdFEyQzFJbjFHa2lPbXFw?=
 =?utf-8?B?cXcyWVZrbk41UnpZSWdYa1FwWFJtK3FxS2lubFZxWjBZN3M5MGFySzdhbEl3?=
 =?utf-8?B?c1QzUGJKbHNCYVZTZWZSWU51WHRBclhTMzlPM29ia1E5Uk0zOWdCR0JJOTUy?=
 =?utf-8?B?OUI5S0EyK1RCWktWOHVUckxBajA1NVU3MjA3Y1hQMllWTEZSWWFlMndNM3Br?=
 =?utf-8?B?NjBnZFFmWWpwQ2FiYXd3bCtIdkEyMkVZdEN5dGlScXI5TjcrQUVvZ3ZLWFJ0?=
 =?utf-8?B?K3NXRDVFWFVsZmxtd2NLVS93cHJSSTd6WnBrUnU0Y0ZxM3dDK0k5emx4Z2xP?=
 =?utf-8?B?N0xjZnBUY2FoMC8ycVNpT1RrQ2JuczhINmRKSzI5TmhrSTk5ZEQ0QjFhdzFl?=
 =?utf-8?B?anRCMlZKMHJkQUpNdStQUnRNZVlhSW01dVV5dHdLWW1OSGREN2ZmbXJiNmNp?=
 =?utf-8?B?ek5HM2R4Q0FHZGRIN0pheFRjMlhkaU5mcEgwZGRJb2NNRkhySU81TERKU01z?=
 =?utf-8?B?NC9CZEt3TjBiRXpBZjZxcW1leHZvSjR2YzZkb1ZhcDM3WFhJZVdDTG4rcW5E?=
 =?utf-8?B?c3NYY1NmSzQyOVlkZjJoZG1JSEJkcW5pbjRheGlGaFkrRDF1NjZrYnNidzFp?=
 =?utf-8?B?bE1tdGdhcDFXQjlTV1NaaDZPSHpjbC9NTkJVSjY1RDYra2Zrb05ZenBtUEZJ?=
 =?utf-8?B?NGpEdGdsNFRjU2E2UlpiTW1ia1F2bUEza09XbkZhK0VBZmJLcGZabjlpY2ZD?=
 =?utf-8?B?dVoxOTJrRmNkVXFaR2NmSFhjNUxQbUF5bk1jVDk3MllYYkdpYXJwamk1M1U4?=
 =?utf-8?B?NWdXK1FmRFVWQUFYOTBvSndad011bEVtdDhqVXUrc0NPdS9vU3JWSW91d2pq?=
 =?utf-8?B?UlZDUEdJSGhFQmtmRDErMHdadUdDUGFlRHBucmUwMzluN1RUOHpDQldwOFln?=
 =?utf-8?B?TEQ2TkU1RHlMaThwSEluRndWdGsxUXlGOWxHR3BLVGp5TWJXWFJKaXJvUW1J?=
 =?utf-8?B?Wk5QcElrUXFqbGlkMytPVkJ4MWEwZ2plTWZUaC9XbTZ5QkZ5c3B0MytsYVVH?=
 =?utf-8?B?TldCTkplZmM3aiswcGRIMFcvblloY1cwWElzQVdReGJTWGRUNXYrSTdDc1Yw?=
 =?utf-8?B?Y2dUSFp6MkMvYjZPU2ZJd1BNaWlRTFAzaGtRWHoyQS9Lbldsb0FTemlrL21z?=
 =?utf-8?B?TGZSbWFvcWdqR1NKRkh1cnFWSmplQTg3SG9xK1Z6dHI2YW9kL2ZtNDBFcXlT?=
 =?utf-8?B?YzI3WVBvd0JJdjdMQkJjdGdnY0ozNnVtUGdZbytXclFoSlpNdXNtRDJuTk9W?=
 =?utf-8?B?WEcvN0loSU8xNFhFL2dobjhmYk8yTVhSQzd4WUNUMitOd3Vxb2JjbERMMHpn?=
 =?utf-8?B?S0wyRmg2TUNLOEtIMUdEYU95aVFPanVnK3Y2Q3JtbnNUYUlMTVZSMlRBUHBn?=
 =?utf-8?Q?+vtv6JNepxk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCs3M3hOSVJCQXV1NHZnZG1iWWkySW5TaHNYUVJwZHh6OHRKY1J2S0NkcSt2?=
 =?utf-8?B?SUcwK1VudUtqVmNrckNwVWhiSzhpVG1PajQ1Tzk1UVUwOU9WUmQzWHhLbkFp?=
 =?utf-8?B?ZXdJdzdjQURZbzh1cHFCZUZNcnRQZEtoMGhPd1ZrWGVIdTdoajREamZUUWlL?=
 =?utf-8?B?ZU50MDhpMVU1MUoyWkdiZlAwZlF5cnBXRDQ4OUozOTA1dTB6enJTTytZRlUx?=
 =?utf-8?B?NjBzM01IbXRhWDJqYjBpNEhSNXQzZmx6LzQvbklMVXRyR201ckt4WTAyakJn?=
 =?utf-8?B?dWhOdzRRTlNUZ2tlWWVjT1lPQmFuMDRhL1d4eVpNRjBwcUhWOG43YTBON0Fi?=
 =?utf-8?B?WklROUQxUGJQQzJzZjdZUUxpZjJRelkwVkloRThPZFgwV1VtektMRGVoMitN?=
 =?utf-8?B?NEUrK2FtbUVZTlRGdXNoTEQ5SC9FWk9ZdjUvRDJhUUwwTFlOakd4RWtnZngy?=
 =?utf-8?B?N2pNcmVrQTNUMVQwU2Y3d0pNN2wvUVhZZmlJVzRqejFKQmdtOEJoZlNlZTd4?=
 =?utf-8?B?MUJLd203WkFkS2lZc00wQXBUZ1oyb3RiOEE1VVhYNitHdklRdkRaSzZzRzlk?=
 =?utf-8?B?NVhjT0Z3REEvL0lsVHdVdG5Lb3VwQWRIRkFtbWpjNk5wa2k5d2t5MlBQaUNQ?=
 =?utf-8?B?cmt2YW1MWW1reFJ1bjVpQ2tyTjZ5bm9heDdCeWNJN2RTUUV1clRKWkNPdU8v?=
 =?utf-8?B?MzM3VW9obkhBMTUxK0hsMkd6OXZMd1M1ZnZxa0E4RHNwSzlIUTRlV0tFSzdu?=
 =?utf-8?B?d2hMdTlLRm4yRUtRUk8vQThlUzFmSjZ6N0J1QlRjT09LaS8xbmV0SER2Zkw4?=
 =?utf-8?B?Y1NRbkNKWGl0NjhrRmZURkFPVXdXZHdZZmlRSm1mQndPQ3J1S2RWQUxmL0J5?=
 =?utf-8?B?MUxTQ0hxQkZGbnZ6N3EwYjRldXNrNmZ1emJ6UG1uVGM0RHVCWjE3TW9NNy96?=
 =?utf-8?B?Zlh4ekt2cGxvMlIrUDZRMTZPR25iZklhWG95c3AzTEJ4aXdHbUJrbVZzN0RQ?=
 =?utf-8?B?VHo4T0FGbms5L2xFcWtkd0YyYURlTHAweXNnR1B6cVlBb3Q0b3pWdE1OcGlF?=
 =?utf-8?B?K3MvTUUrNmRhTGp1eHNzMFZXNExQUzZrajRWMjdXbnhyak9WbUhhdHRSM3pC?=
 =?utf-8?B?M2dqVll4eTVJaW5TbW54cmcwNUpJcjRiMzRzZG9wWk1iekg1VHZsd2c4VEpl?=
 =?utf-8?B?Z0VsbEFLbEpLdVVLSnVrOVhjRXF1OVlDZlg0QmNrZUUzQmFjdEF5bk45eGRE?=
 =?utf-8?B?WXl6QWlUbEZjQlNRQzJYUExiR09memhGeHl1NlA3LzRpajZ4RVBDYzUxeUcz?=
 =?utf-8?B?S0xsbGZLWnFXUGVlUGpkYUdrNnduaXU5UElZUTZmWDRPUHBsWGdQTzFqNzVQ?=
 =?utf-8?B?ZDdTRUorWWZPTEl6VUQ4Z1R2R043bXdYeWlIR2krY3VZR1M4OC9OY3lCdTFx?=
 =?utf-8?B?dzBXTkVrY3Z3Zm5RN0pjVW1iY2V5QldTcjJSNGFOMDdTWVFacjBtN3ZUaThi?=
 =?utf-8?B?ZWU3VUNOdTV1N05UNjVvUmZwYnE5aGRTV2E4aElFZERLcFlqTDV0ZytQYXA0?=
 =?utf-8?B?TnN1blhiRE0vOWhudFpUQ1VWZDFxTjQ0TERaT3RRUTRNVDRPZWExRm9ha1hs?=
 =?utf-8?B?MjNnVGpOaXJuME1TMFNLMnZpYy8yS1RUMjFheHVYcUc2T1hkTThmS0dQYzlY?=
 =?utf-8?B?eDNNVVY1b09WUlAyVmNjWm1NVGNVK00xUkNGeks0WEdqZ2E3bE9CQmdXZVlv?=
 =?utf-8?B?c3pJa3hRRlZtVjhRc0JMMWIrSWdGdTZvVGRWMkRXOWtTOUZEVEhEdFgzWjJq?=
 =?utf-8?B?WXZndWE4REk5bG9KalZEYnhiYVdoWU4rbEhXalZ3ZkNRZzREODZ4c3ZkOFd3?=
 =?utf-8?B?NWNPdzRUaDdMb0xQa0VuNjhGWmEvQ2J2dVBielErK082MjRacUEyK2ZKRGdE?=
 =?utf-8?B?UUJkL3MxMEVaL1dNNFJMcFYwWU8vU1N4ak5DQkZ6Sng4Y2xPbVFGRm1rWFpa?=
 =?utf-8?B?bURjcUF3RldlU0d0L0c2UTFDUmdCQW9LQnFQbU5zbWNpWDQ0SUQxT2dGMFZZ?=
 =?utf-8?B?V2tjazFmcndWN2lLUGtDMURrcUtxbTdkWVRWcnZEV1lXOEpnb2FweTJ4T296?=
 =?utf-8?B?SDloaVNHSnYrcmJGZm01cldPTGVoamQyRUFBblZkclhZbU5Xa3NvNkdQM0Zl?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28ecd81-0767-4ee7-e175-08ddc7fe3326
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 02:27:55.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/qkc9BYyUGO65Nuz00Z287HxabvduvFL4/I8fmARQxwA0EilrFDT9WlB1D6GBGA78PVDuyC/zlsetbhtiep9vq5jH1yYYG1SuWeKkq1Ot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_192831_804081_7CC18320 
X-CRM114-Status: GOOD (  11.09  )
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

SGkgTWFya3VzLAogICAgVGhhbmtzIGZvciB5b3VyIGFkdmljZS4KCk9uIDIwMjUvNy8xNyAyMzo0
MiwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4gW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbWFya3VzLmVsZnJpbmdAd2ViLmRl
LiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91
dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPiAKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPj4gVXNl
IGxvY2FsIHZhcmlhYmxlcyBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBpbnN0cmVhZCBvZiBnbG9iYWwK
PiAKPiAgICAgICAgICAgICAgdmFyaWFibGU/ICAgICAgICAgICAgICAgICAgICAgIGluc3RlYWQ/
Cj4gCj4gCj4+IHZhcmlhYmxlcy4gVGhlIGdvYWwgb2Ygc2F2aW5nIG1lbW9yeSBoYXMgYmVlbiBh
Y2hpZXZlLgo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBhY2hpZXZlZD8KPiAKPiBZb3UgbWF5IG9jY2FzaW9uYWxseSBwdXQgbW9yZSB0aGFuIDU5
IGNoYXJhY3RlcnMgaW50byB0ZXh0IGxpbmVzCj4gb2Ygc3VjaCBhIGNoYW5nZSBkZXNjcmlwdGlv
bi4KPiAKPiAKPiDigKYKPj4gLS0tCj4+IFVzZSBsb2NhbCB2YXJpYWJsZXMgc3RydWN0IHJlZ21h
cF9jb25maWcgaW5zdHJlYWQgb2YgZ2xvYmFsCj4+IHZhcmlhYmxlcy4KPj4gLS0tCj4+ICAgZHJp
dmVycy9ydGMvcnRjLWFtbG9naWMtYTQuYyB8IDE0ICsrKysrKystLS0tLS0tCj4g4oCmCj4gCj4g
UGxlYXNlIGF2b2lkIGR1cGxpY2F0ZSBpbmZvcm1hdGlvbiBoZXJlLgo+IAo+IAo+IENhbiBhIHN1
bW1hcnkgcGhyYXNlIGxpa2Ug4oCcQ29udmVydCBhIGdsb2JhbCB2YXJpYWJsZSBpbnRvIGEgbG9j
YWwgb25lCj4gb2YgYW1sX3J0Y19wcm9iZSgp4oCdIGJlIG1vcmUgYXBwcm9wcmlhdGU/Cj4gCgpX
aWxsIGRvLgoKPiBSZWdhcmRzLAo+IE1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
