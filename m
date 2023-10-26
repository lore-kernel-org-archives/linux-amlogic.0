Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622EEC25B6B
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvOp+xc+bK0nNlbxfwRTC/jrzg8Ek/gVhiTQrV1a+XY=; b=rBRqH+DS6kyPDakScCRFRFFtqu
	AFvSKb2XwyvHI65IwEUK/TRg7Aws66FE2PGGCp7PDA6aPSurEDP3//CmeOrRCoX0+1Qrj+vhoqxPa
	YMv9ZlrCUpGAwOV2T5Gyb/U/BxK5B00pqLfuUVJh38CrgJtwXcyRhQ/D5SN1zEAeCt54T1hOKk1nX
	J0BR0KvkmNdP3U4VqLopXtW8BEyb242SMl0IZc8ba/Q34X5IMKqPxi6zx8dsZgmSAqGX1duX47TSx
	bMC/K0Eug8U/1lYD/YIxzYSy8zASd7Cs72RTtfbogu7EjyVdKfxA/IF54HPeF686HZb6k3fWINCKr
	9nrRtq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvuz5-00Ds9H-29;
	Thu, 26 Oct 2023 07:40:51 +0000
Received: from mail-psaapc01on2072a.outbound.protection.outlook.com ([2a01:111:f400:feae::72a] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvuz2-00Ds8Z-1C;
	Thu, 26 Oct 2023 07:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7TiDdXZhtlPhjrupepUg8ip3BgKKfbBIKf9xSku9BGpXS1BTMs4jLgivqaqcvqmFbli76oMSClkuYBHOGUNCanf9tng9Svq0tZJThtbi/GUsh71KZ4CC1OgPGGRBAU2j/IGJZsKaWzUtrF6XczRTUhfnXmyopVyw8ObrpKh4u3jRXLS+4d2myYPYqhI1mAdXtK+mu6Pfk+c4QbPm9zwTkbTvmoYUKe7X1ZK4ZCa4GaVVf2jk7IMiS/53ccB+K/wxzVvN3RANwZAeMUNheikNDz6VphA9c4odj/8jM90xTvONFQ6pcRyrr5rMeE3R9X+YNSRvRg4K661m6qi9Jw12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONKcJVsQyuwDUdhWZ/wOx8o7jFcwUCQstQnQNV393rU=;
 b=SV8zs+0dbDBBwHY3vjE7rRcfMi39oPQm3mbyB8wArNQEnvdZZymP+oyb1x+meBAiHlOlVUPWKvSSdPVhnqyezj6c7HqEqJ0PLXmBTLfTD32n3OwHd9EyWk8NyUMp7LuAIUc+6cVqS82zMbiBNahIJoXM+kUHEXDPyNQDfrygge+PpAhimAnmnw8qG/ytmvkrnZjzjpDB5J5lCgtSRt25RdRLxWhdedKoFRh+I/XRJVjTLCiVler+7uGnBr1Gvwdia8aTNaisg4JrXPW0RUy6geAT8KH5V1WMHAbxRwdS0fm9MzqZRqOKiAtAh5j3KESxgq7AGc+Qst+0bu4WbHGzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONKcJVsQyuwDUdhWZ/wOx8o7jFcwUCQstQnQNV393rU=;
 b=PLkZjWL2HAWDS2VAh/i5r1v8oMV2K3pCek7HWjhalxvLbkBUKQn3Z8b5VN+e8sY0luZP2PjCoyP4EgmnxwBRcWopGeua2vaGmLo4+QmOjYacA6RDeLJlAYQniOzjPdHDCEQ/NuUy+Ksz8KBhc3zkIR/PJOyFHZ2HcPAEcr6k2yfMVj8qdxYEiF9zTh2JwVa9HLAykT4FaQaml6X/zG8orT9pXgbNvVPqiVxMaGrD0S92pCJ++0ArN9ZuU1sa0YnSYF+gfqhm20H5W9HInAymoNKcfKZ48hhbJdZu76vrT9HiGeYo1LlFsUGcgmSPiICcIM2a0dmELhx20ieFWyivMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5939.apcprd03.prod.outlook.com (2603:1096:400:126::12)
 by KL1PR03MB7503.apcprd03.prod.outlook.com (2603:1096:820:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Thu, 26 Oct
 2023 07:40:36 +0000
Received: from TYZPR03MB5939.apcprd03.prod.outlook.com
 ([fe80::4011:f41:f71f:355c]) by TYZPR03MB5939.apcprd03.prod.outlook.com
 ([fe80::4011:f41:f71f:355c%5]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 07:40:36 +0000
Message-ID: <7c81e31f-3ece-4a95-80db-dfe7fcd4de0a@amlogic.com>
Date: Thu, 26 Oct 2023 15:40:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
To: Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20230927072544.764285-1-Rong.Chen@amlogic.com>
 <202309271651027503622@amlogic.com>
 <1jil7wkl39.fsf@starbuckisacylon.baylibre.com>
From: Rong Chen <Rong.Chen@amlogic.com>
In-Reply-To: <1jil7wkl39.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TY2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:404:42::13) To TYZPR03MB5939.apcprd03.prod.outlook.com
 (2603:1096:400:126::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5939:EE_|KL1PR03MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 10cce0aa-cbe1-44dd-6d60-08dbd5f6d7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oq9kPDgMcNhYHrJmMW7I0TXo0Sqq7mYNrl9trzmarj4c/CQs3lGGLGsyg/gXEhuA8v9aIeWe2MQjIm3pmfJM7ezHM3oBc9g7FYbbNiwfo4LKZcRyemBY0Ymh3VKaMb55sEK7pjnn2VPwcoaJ9pjuaEvQJG0+mck2/rnamCd/ECIvNwjXLad6l1yvxAH/DToQjR7f6uZ11a2MSs3FyYSR9KxTVAJkD3+djmLw0mspALjclX3Rnomveg4DMXlPh0IbX4BMyOLYaUzMznMRHU3bas7vpJIj4R1UejKj4P/W7YgF2TuxK2QruowHxmOdY6eZ/ItjfdmquVGgqCocRE/GilzgMN4dAhGwVVCdNZ6Uz5WZ/WW4dYoW/Poc5SFO/oPwkTUWxqYaY4bYyywjoyxb04/Kq38uFloDkCX0eLIEJEYcAQEAzcWCT4+mobzM2OCk23WHK/zTNnrPcJzAYQ7X+Xb0ep4LNA69qjCoutzkd+tcEOWMskmDVkFe48np7ZDnPOb3V5aBswWKejSdnM9yiJcW5HLaJKDbSW0iTSOeOE4qKn7giKMgtD6WAaJl78Br+r3vxckQUO4+jm4+HnXFHSi9IoAxN2m7hQnQC4XDZ/L/lOz6uwjgj7PS76bBusDYP+I7Wqwo9uZm/lgiZ9T5/7Tsn95clMf3ONu6RiwTsO00WvhytGsvJ8t2mLxX+Uzs21OFN/gnWPqiZBU63XjqLbWH06SGbATMVtFIz5fqOX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5939.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39850400004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38350700005)(26005)(31686004)(38100700002)(2906002)(41300700001)(86362001)(31696002)(5660300002)(8676002)(36756003)(8936002)(4326008)(478600001)(2616005)(66556008)(6506007)(110136005)(6512007)(54906003)(316002)(66476007)(6666004)(66946007)(83380400001)(53546011)(52116002)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RjV0dLUzdOYVZleHNPbWxZZk85anhVZjJCRXhSeEJ1bkttT3FucEZZTzFz?=
 =?utf-8?B?K0hTeXBhTWlJVTVRQkJHaWZmM2ZnSk9QL2ZjMG1FQ1NQcVFVV1NvS2Z2a1FZ?=
 =?utf-8?B?VUk4MmJIaVdRZUlBam1XRlZUNkh6YTlxTGVWcmdMMFQ2Z2JCRjRIY08rQXMr?=
 =?utf-8?B?ejJnZWlXSXpPeTFLN05SZjdmWi9wYnU1TytXNmtFRHdXQm1iUldqa2I4N1Er?=
 =?utf-8?B?bkdOZW9aU1BzK1M0Z2VmeFdzb2FxZmtwVDBlNnBzdk1rUGtiRGdVamNYL3VF?=
 =?utf-8?B?QVZFZ1dMbDdaQXJlS3BRaXFDRHRDWUVlWnZQNTBvb2p0eTFRSHFJOFVhMmJn?=
 =?utf-8?B?VU8vSHJyak9WekwxM1JrWnRjbm5lQ1pDMjJzQ1drV2hQZWdyeUZNTy8wWSsw?=
 =?utf-8?B?bWljSDQ0WWJBd0pZV2VDTEw0OEVnb1RUK21adVZaaDMrMWszcWg2Ymt0Z1ZV?=
 =?utf-8?B?YW4wWXVsS2l0QzF3TzluM3RqenVWTGFaTDI0THNPaWZYQ29kWVFWQytTNXdP?=
 =?utf-8?B?QVFMaW93d0xFb2owdUhMMWczN2pFZW5vcGx5b3lGMjFZS1VDM3BLN3ZUenNo?=
 =?utf-8?B?akV3NUtmdU9xRnNyb3krVmRZRjM1alhFYjNYR055SmdvMlZDMDlaZmhuck01?=
 =?utf-8?B?R1FPVG00aDcvN0s5bXgvMzZNUjY3c1pydW5pc0YzNmZnM2NRcWlXTDhtTTgr?=
 =?utf-8?B?OWNRVjdJM2hWRldVRndHWHdJajNCWFhGeTh0K2hBKysrY3dIdTB4OFVtc0pE?=
 =?utf-8?B?bzZpeTdaQnJrVUJBcW5kWUVtK1p0N3U0WGZZeWd0QnJJWWVuTXZRZ1B3Z2Jh?=
 =?utf-8?B?ZW9zMHBtOTNERVZFN2xMYkdtb0J5N255ZUlzaCthL1ljZkhhaG1nSy8zNUho?=
 =?utf-8?B?R1ZiSTVjOU9WS0xXUFVsRVZ1aEdVY1kwTnR4cTFSMC85MlNLOEt1TGlnL05G?=
 =?utf-8?B?b0Q4b1ZhUldodnlaTm1kTlc5Yk9sS1QyQWQ5dmhDaGVma0lsQ2xNaXRqNWRi?=
 =?utf-8?B?LzNjYXNpanZNOU1CSjhRd1BLTnlXNkVFSWJPS2VnNjBzaFo2T21adUFrcnNX?=
 =?utf-8?B?amRhMEdJcXVLZWxHOVZNajAvZUZISDBFd040L29TbDF2c2tzT3ExcGh2aTJq?=
 =?utf-8?B?R0lqQUVGRHpReE9Bc29aN3NEblF6OExLQ0pVL0laYno5Nm8wd1lZQkJTRWhX?=
 =?utf-8?B?N0Fjc21VU1JjWVFQbnEvWEIyUk42eHdxOXh4d3JLeUg5TU1aVzhlclV0bGgx?=
 =?utf-8?B?UXlwaUdpWlphcVhpVjFzaWpPZWlFSVp1Mko3d2ZFL3l2OFU4azJxVXNoWFp2?=
 =?utf-8?B?QUorT2Jxdm9WMk0wUVhPS0t1VHZwUGMxaWJLUjE4VXY5bVZmVXpIZytzSEJx?=
 =?utf-8?B?eEFVNTdIK2o2Nk9aSTZ6SnIwUDZsM2FZamR2SlcwYWNNbmxRR0E2S3RNclB3?=
 =?utf-8?B?alZudTIyWTVBdThmbUs4RGVHRGJwREZoS3FXUmlNUU1CMkRMTHZ6VGczaVIz?=
 =?utf-8?B?dUlZV2VvbDV0S1R4RjdlSnFqTDdZcDZsMEd5MnMzMjRZU0FmT1YxR0VSTGkw?=
 =?utf-8?B?T0ZHZDhORE9MT0hmN0NEZkxoeml0dWg4TzdoQkZaN3R2Nkl0RVZXd0diSVZ1?=
 =?utf-8?B?Qk16cDkzWjdYTnpOSXlMMmZvUEhTT1RzWmZ4OXBhQTF5T0Q0NHF5MWViOG15?=
 =?utf-8?B?bjZ4S0gxVGx5dnZGTzNxRFdDR1NTbGhRTnRhNmkvbVdIVGJIUldjNWE5SEo0?=
 =?utf-8?B?THY1Y2dvNVJLUzFjVHNyOFErTVVXdHVqTnhJOC95YUdSWUQxdUtKRnlXamlM?=
 =?utf-8?B?a2ZlWFFaeGV0aEttOUc0VUlNUFd0WUZsVFBqTmdyaHJ5L1loYmpnaHY4Ykh6?=
 =?utf-8?B?VThYdmNVQzdQVEswa28yQ0dXdldzQUd3TG50bDhmQnNOak5IdmlZam1sdDBu?=
 =?utf-8?B?dUt3U0xtZEV4UWFMSmZGSlA3dnRqb2lReW01dWU2YXVRYmJtYk9XcFRJaEZp?=
 =?utf-8?B?b2ZMTEJpSHpBNVR1UmtHQ2VDeEJuR05iSmJ6bVBwak51RGQzNEJKMjZFTEpk?=
 =?utf-8?B?b0M2K1QzS3Zna0s3UUVpam9uZk0wVDR4dkhQV1ZKbnBpcTF0c0JHL0JiVmpX?=
 =?utf-8?Q?sucqJj40TUcZasRLzsBOMFTlH?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cce0aa-cbe1-44dd-6d60-08dbd5f6d7fb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5939.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:40:36.6868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhFNyW2fLvzPpdTMbVtXypJNz6stMWSWXSbkRzUQrNk9wqjZLIbrH/zcUEZIwjdgFKJ/AdUecZWsMoOlcdPJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_004048_434054_466FEB72 
X-CRM114-Status: GOOD (  30.27  )
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

SGkgSmVyb21lLAoKSSB0ZXN0ZWQgb24gbWVzb24tZzEyYS11MjAwIGFuZCBtZXNvbi1zbTEtc2Vp
NjEwIGJvYXJkIHN1Y2Nlc3NmdWxseS4KCiptZXNvbi1nMTJhLXUyMDA6KgoKWyAxLjMwODQzNl0g
bW1jMTogbmV3IEhTMjAwIE1NQyBjYXJkIGF0IGFkZHJlc3MgMDAwMSBbIDEuMzA5MjIzXSAKbW1j
YmxrMTogbW1jMTowMDAxIEFKVEQ0UiAxNC42IEdpQiBbIDEuMzE0NzI0XSBtbWNibGsxOiBwMSBw
MiBwMyBwNCBwNSAKcDYgcDcgcDggcDkgcDEwIHAxMSBwMTIgcDEzIHAxNCBwMTUgcDE2IFsgMS4z
MjE3MjRdIG1tY2JsazFib290MDogCm1tYzE6MDAwMSBBSlRENFIgNC4wMCBNaUIgWyAxLjMyNTcy
N10gbW1jYmxrMWJvb3QxOiBtbWMxOjAwMDEgQUpURDRSIAo0LjAwIE1pQiBbIDEuMzMwNDI3XSBt
bWNibGsxcnBtYjogbW1jMTowMDAxIEFKVEQ0UiA0LjAwIE1pQiwgY2hhcmRldiAKKDUxMTowKSBb
IDExLjM2ODI1MV0gcGxhdGZvcm0gY3B1ZnJlcS1kdDogZGVmZXJyZWQgcHJvYmUgcGVuZGluZyBb
IAoyOS42OTU2NDldIG1tYzA6IG5ldyBoaWdoIHNwZWVkIFNESEMgY2FyZCBhdCBhZGRyZXNzIDAw
MDcgWyAyOS42OTY0MDJdIAptbWNibGswOiBtbWMwOjAwMDcgU0QxNkcgMTQuNSBHaUIgWyAyOS43
MDgwNTNdIG1tY2JsazA6IHAxIFsgNDguMTMyOTY3XSAKbW1jMDogY2FyZCAwMDA3IHJlbW92ZWQK
CiptZXNvbi1zbTEtc2VpNjEwOioKClsgMS44MTU0MTZdIG1tYzE6IG5ldyBIUzIwMCBNTUMgY2Fy
ZCBhdCBhZGRyZXNzIDAwMDEgaWxlZDpbIDEuODE5NTQyXSAKbW1jYmxrMTogbW1jMTowMDAxIDAx
NkczMCAxNC43IEdpQiBObyBzdWNoIGZpbGUgb3IgZFsgMS44MjYyMDddIAptbWNibGsxYm9vdDA6
IG1tYzE6MDAwMSAwMTZHMzAgNC4wMCBNaUIgWyAxLjgzMTY5Ml0gbW1jYmxrMWJvb3QxOiAKbW1j
MTowMDAxIDAxNkczMCA0LjAwIE1pQiBbIDEuODM2MjUwXSBtbWNibGsxcnBtYjogbW1jMTowMDAx
IDAxNkczMCA0LjAwIApNaUIsIGNoYXJkZXYgKDUxMTowKQoKWyA1Ljg1NzQzN10gbW1jMDogbmV3
IGhpZ2ggc3BlZWQgU0RIQyBjYXJkIGF0IGFkZHJlc3MgMDAwNwoKWyA1Ljg1ODA0Nl0gbW1jYmxr
MDogbW1jMDowMDA3IFNEMTZHIDE0LjUgR2lCIFsgNS44Njk3MjddIG1tY2JsazA6IHAxCgpbIDku
OTU4NDQ5XSBtbWMwOiBjYXJkIDAwMDcgcmVtb3ZlZAoKCuWcqCAyMDIzLzkvMjcgMTc6MzAsIEpl
cm9tZSBCcnVuZXQg5YaZ6YGTOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gV2VkIDI3IFNl
cCAyMDIzIGF0IDE2OjUxLCAiUm9uZy5DaGVuQGFtbG9naWMuY29tIiA8Um9uZy5DaGVuQGFtbG9n
aWMuY29tPiB3cm90ZToKPgo+PiBIaSBKZXJvbWUsCj4+Cj4+IFNvY3MgY29udGFpbmluZyBwcmV2
aW91cyBjb250cm9sbGVycyBhcmUgZ3hsLCBneG0sIGd4YmLvvIxnMTJi77yMZzEyYe+8jHNtMe+8
jGF4ZywgYTHvvIxzNCBhbmQgdDcuCj4gVGhhdCBpcyBtb3N0bHkgYWxsIHRoZSBTb0Mgd2Uga25v
dyBvZiBpbiBtYWlubGluZSAuLi4gVGhpcyB3aHkgdGhlIHdheQo+IHlvdSBleHBsYWluZWQgaXMg
Y29uZnVzaW5nLgo+Cj4gQW5kIGJlbG93LCB5b3Ugc2F5ICdvbiBsYXRlc3QgY29udHJvbGxlcnMn
LCBva2F5IGJ1dCB3aGljaCBvbmVzID8KPgo+PiBUaGUgYml0IENNRF9DRkdfRVJST1IgaXMgdXNl
ZCBmb3Igc2VsZWN0aW5nIFNHIExJTksgb2YgZGF0YSBhZGRyZXNzIG9uIGxhdGVzdCBjb250cm9s
bGVyc++8jGJ1dAo+PiBkYXRhIGFkZHJlc3MgZG9uJ3QgdXNlIFNHIExJTksgYXQgcHJlc2VudO+8
jHNvIGl0IHdpbGwgY2F1c2UgYW4gSVJRIGFuZCBzdG9wIHdvcmtpbmcgb24gbGF0ZXN0IGNvbnRy
b2xsZXJzLgo+PiBUaGVyZWZvcmUsIHJlbW92ZSB0aGlzIHNldHRpbmcuCj4gTm90IHRvdGFsbHkg
c3VyZSB3aGF0IFNHIExJTksgYnV0IG9rYXkuCj4KPiBXaGlsZSB0aGUgY2hhbmdlIGl0c2VsZiBp
cyBmaW5lIHlvdSByZWFsbHkgbmVlZCByZWZvcm11bGF0ZSB0aGUgZGVzY3JpcHRpb24uCj4gQmFz
ZWQgb24geW91ciBleHBsYW5hdGlvbiwgc29tZXRoaW5nIGxpa2U6Cj4gLS0tCj4gRm9yIHRoZSB0
NyBhbmQgb2xkZXIgU29DIGZhbWlsaWVzLCB0aGUgQ01EX0NGR19FUlJPUiBoYXMgbm8gZWZmZWN0
Lgo+IFN0YXJ0aW5nIGZyb20gU29DIGZhbWlseSBYWVosIGl0IHdpbGwgc2VsZWN0IFNHIExJTksg
b24gZXJyb3IgYnV0IHRoaXMKPiBpcyBjYXVzaW5nIGEgcHJvYmxlbSB3aXRoIHRoZSBkYXRhIGFk
ZHJlc3MgLi4uIGJsYWJsYWJsYQo+IC0tLQo+Cj4gUGxlYXNlIGV4cGFuZCBhIGJpdCBvbiB0aGlz
LCB0cnkgdG8gbWFrZSBpdCBjbGVhcmVyLgo+IEFsc28sIHBsZWFzZSBpbnNlcnQgdGhlIHByb3Bl
ciBmaXhlcyB0YWcKPgo+IExhc3QsIG1ha2Ugc3VyZSB0cCByZXBseSB3aXRoIHBsYWluIHRleHQg
ZW1haWxzLCBvdGhlcndpc2UgbGlzdHMgd2lsbAo+IGRyb3AgeW91ciByZXBseSBhbmQgcGxlYXNl
IGRvIG5vdCB0b3AgcG9zdC4KPgo+IFRoeAo+Cj4+IFRoYW5rcy4KPj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBSb25n
LkNoZW5AYW1sb2dpYy5jb20KPj4KPj4KPj4gICBGcm9tOiBKZXJvbWUgQnJ1bmV0Cj4+ICAgRGF0
ZTogMjAyMy0wOS0yNyAxNTo0Mwo+PiAgIFRvOiBSb25nLkNoZW47IFVsZiBIYW5zc29uOyBOZWls
IEFybXN0cm9uZzsgS2V2aW4gSGlsbWFuOyBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4+ICAgQ0M6IGxp
bnV4LW1tYzsgbGludXgtYXJtLWtlcm5lbDsgbGludXgtYW1sb2dpYzsgbGludXgta2VybmVsCj4+
ICAgU3ViamVjdDogUmU6IFtQQVRDSF0gbW1jOiBtZXNvbi1neDogUmVtb3ZlIHNldHRpbmcgb2Yg
Q01EX0NGR19FUlJPUgo+PiAgIFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gamJydW5l
dEBiYXlsaWJyZS5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdAo+PiAgIGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+Cj4+ICAgWyBFWFRF
Uk5BTCBFTUFJTCBdCj4+Cj4+ICAgcwo+PiAgIE9uIFdlZCAyNyBTZXAgMjAyMyBhdCAxNToyNSwg
IlJvbmcuQ2hlbiIgPFJvbmcuQ2hlbkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+ICAgPiBGcm9t
OiBSb25nIENoZW4gPHJvbmcuY2hlbkBhbWxvZ2ljLmNvbT4KPj4gICA+Cj4+ICAgPiBTZXR0aW5n
IGJpdCBDTURfQ0ZHX0VSUk9SIGhhcyBub24gZWZmZWN0cyBvbiBwcmV2aW91cyBjb250cm9sbGVy
cy4KPj4KPj4gICBXaGljaCBwcmV2aW91cyBjb250cm9sbGVycyA/IHYyLCB2MyA/IENhbiB5b3Ug
bGlzdCB0aGUgU29DcyBwbGVhc2UgPwo+Pgo+PiAgID4gSG93ZXZlciwgaXQgd2lsbCBjYXVzZSBh
biBJUlEgYW5kIHN0b3Agd29ya2luZyBvbiBsYXRlc3QgY29udHJvbGxlcnMsCj4+Cj4+ICAgSXNu
J3QgaXQgZGVzaXJhYmxlIHRvIHN0b3Agb24gZXJyb3IgPyBzZWVtcyBsaWtlIGEgc2FuZSB0aGlu
ZyB0byBkby4KPj4KPj4gICA+IFRoaXMgYml0IGlzIHVzZWQgZm9yIHNlbGVjdGluZyBTRyBMSU5L
IG9mIGRhdGEgYWRkcmVzcy4KPj4gICA+IERvbid0IHNldCB0aGUgYml0IENNRF9DRkdfRVJST1Ig
YW55bW9yZSB0byByZXNvbHZlIHRoaXMgaXNzdXNlLgo+Pgo+PiAgIEknbSBub3Qgc3VyZSBJIHVu
ZGVyc3RhbmQgdGhlIGFjdHVhbCBpc3N1ZSBiZWluZyByZXNvbHZlZC4KPj4gICBDb3VsZCB5b3Ug
cHJvdmlkZSBtb3JlIGRldGFpbHMgcGxlYXNlID8KPj4KPj4gICA+Cj4+ICAgPiBUaGVyZWZvcmUs
IHJlbW92ZSB0aGlzIHNldHRpbmcuCj4+ICAgPgo+PiAgID4gU2lnbmVkLW9mZi1ieTogUm9uZyBD
aGVuIDxyb25nLmNoZW5AYW1sb2dpYy5jb20+Cj4+ICAgPiAtLS0KPj4gICA+ICBkcml2ZXJzL21t
Yy9ob3N0L21lc29uLWd4LW1tYy5jIHwgMSAtCj4+ICAgPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKPj4gICA+Cj4+ICAgPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNv
bi1neC1tbWMuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPj4gICA+IGluZGV4
IDk4MzdkYWIwOTZlNi4uYzdjMDY3Yjk0MTVhIDEwMDY0NAo+PiAgID4gLS0tIGEvZHJpdmVycy9t
bWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiAgID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNv
bi1neC1tbWMuYwo+PiAgID4gQEAgLTgwMSw3ICs4MDEsNiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9t
bWNfc3RhcnRfY21kKHN0cnVjdCBtbWNfaG9zdCAqbW1jLCBzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNt
ZCkKPj4gICA+Cj4+ICAgPiAgICAgICBjbWRfY2ZnIHw9IEZJRUxEX1BSRVAoQ01EX0NGR19DTURf
SU5ERVhfTUFTSywgY21kLT5vcGNvZGUpOwo+PiAgID4gICAgICAgY21kX2NmZyB8PSBDTURfQ0ZH
X09XTkVSOyAgLyogb3duZWQgYnkgQ1BVICovCj4+ICAgPiAtICAgICBjbWRfY2ZnIHw9IENNRF9D
RkdfRVJST1I7IC8qIHN0b3AgaW4gY2FzZSBvZiBlcnJvciAqLwo+PiAgID4KPj4gICA+ICAgICAg
IG1lc29uX21tY19zZXRfcmVzcG9uc2VfYml0cyhjbWQsICZjbWRfY2ZnKTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
