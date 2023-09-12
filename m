Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA43CA0ECF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Sep 2023 06:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viPNLhgCbgT2yXvVnS286sh5xxNgebVMNAhitMb398I=; b=hHpZl3PiAYYZYVhXjduNkT8OqW
	4tU5pmQhkthcnoJGzqV9Ai1Ma+20NCvKnuX3USyiMeTXlDUKc5YCGm3OI1+Zh3vgHHUelJgLW3J/W
	ezo26k/mmzKJL7LABn1r8xeQPidpwbEiYSH+IK7llk9qmVYFbZxTiEdFweVf4J+Fv+tWigXDncUZm
	kIybjl3PG0oPkx2YknURdMKtzpD+tw1CA4zsvU3JfLWv64HB58fRwABwyuJBgmZf2Ipo/ugoijR4S
	rDHwQzLwYan8A8/3FY4une8oe/xq/c/8J75PUqnkjlh2kQAMypAU6CBpmwIEYu4mAf60vKqRWIop0
	LKTQK2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfx2P-002IBO-1t;
	Tue, 12 Sep 2023 06:38:17 +0000
Received: from mail-tyzapc01on2070b.outbound.protection.outlook.com ([2a01:111:f403:704b::70b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfx2M-002I8U-1I;
	Tue, 12 Sep 2023 06:38:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpWlVjMES3p2t+w0QdmPcv10aHndzguoF3F1OwoyvWfaQ2MNJOXfvr7efInwLzG/5FeVU1F3qcdWJOYnYG5RNSdThFK8OTJQx72iiSjqLGfQ8VLqza3kAGv2gtUzYvuqbgCFaeS7DYT0fVRGstGvvrUCaMcQqcBc1ski/Luyl8UKcQmgWomDMgzU885VGm4+qNBxRRCKH4fLPefzBdZBK9kD3rB2LjNBIoJOrw3RVg8MrGzxWQafiVwEdXrIAIlwCVwfxqrDxeV9MacWjcR6Mq/bbigCMoJI+SGGo4Aa6lOlh5Si/Jf55n6kfyiUznBiySc7OH4bMOxYUeabl85h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCW++eDP/Gnf9DoyRzpYy4ws4V3oEs8BTny0Ng+n7O8=;
 b=YQy5dfFPUmslJ8cKzRhnm48GzBb7ScJ0w/KwHWe3DfjX1NSdzcHB/6z8nHxbzogAX2QbC0xxd9WgiaxkkPZChU/Yy6nYffMUM0jlWHHaTVcGKKmc+/HhSvwcEtz3DpZpGkTlMQ57XNMGzMIz7Ex2ZfWJlNMJHkrQ0GmjtLnJLybquuikq5iJiHPH7XiPtsHgnYCEzuvK9xbarWJmOPqjHuOTveaigkj1wDIxfZ7e5VJiY9DBeewpdEWhR8JmxjnQjlUcMWXhD2xF51PEMJpyuoMdNZo0geyQsv5gpWi6J1PxB2517+5qitoBtAxH3Cytqqv8WRiczgAY1oAHMy1xcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCW++eDP/Gnf9DoyRzpYy4ws4V3oEs8BTny0Ng+n7O8=;
 b=CtS0Ji599ziWsE/nkc/c/JVJmvhcjtmLxRY2ru/7Cr/QIQOE7TqQU5T7LUEERfL1XR5OxM2cwelDB9+lUy+VfYPVIO0cebyP6KFkEpexWULm9eSo51jESoRDVG9t4fbtY/uIgsUYwSwU3VKFDetSXSv9nco+HB41T5RDWt2WPyKe01cRthwRl2NQoe8xUgJoWsYzIikqlaCTpBoOKPwJQdgf7MO+4WUODY+TXuoffyBIxOR0f6BJatv2B2IW2eXzdaI47YOlUDDppWdIYoGLnbrZ0denWuwcybIj+PdW8KXcC9owUhxGIgJGpxKxdrJ54WSazOLRFXU3e1bkkUrtvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by TY0PR03MB6773.apcprd03.prod.outlook.com (2603:1096:400:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 06:38:03 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::efac:f92d:887b:8d85]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::efac:f92d:887b:8d85%3]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:38:02 +0000
Message-ID: <076b59c0-7585-ea98-014c-cd70f92df002@amlogic.com>
Date: Tue, 12 Sep 2023 14:37:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
To: neil.armstrong@linaro.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
 <55cbdbba-39c6-7415-37db-97d2c35412cb@linaro.org>
From: Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <55cbdbba-39c6-7415-37db-97d2c35412cb@linaro.org>
X-ClientProxiedBy: TYAPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:404::16)
 To TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|TY0PR03MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b98148-04a5-4c06-1afd-08dbb35ad03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: At5gx/ifrrjL37wk9JbttZm+8JZWCeU5/S48XzQk27zsthgsgbpclzgi0ngdLV2XQ/IbOnKm288MUl7nDbr5/sW7n56VxkdMsjeXuQFzBw8QlVtS4t29RFEnWEmCoWAnVWHni1cwunNHdrjaksT9sbUCnSLLT9o4x/yB8+geG6PcLdDilg9jsWYfptZDUvlwCuuAx9RX4d4eNx3rFQjne20C6yXtyAf9a9rFUKuS0CcNrwMXlyLqSGKdSSqNggxNqoGBiY+5BCjHdJaW7Zqb3QHuZNFlHAAoDNWqDAtDlANGQOgZk6fIVZ+Gp4zQ44Adoq6G771f1T6zzjmOKGGRXNxCxh33tLbVmniTlNm5oEpYl49w53mKy0XiFT6S2yAshSPe4j8LTGAbWCk/Wxkd2xAtOfstFIr5K60+XSQkRTPUX0Nw8SfnM//TVZh8tAF83hp0SOa+LHNZFh/znjSXt6SAOH33moNS11r8ofFj5r49rQbwMpGfvFqyF6KzU4XunzW+huZLkqSxujyxoDcGqLrtEOBBrxPGaYwPuglqemE0mWINNmBWMdUopomoH8vVnaU3qcsUh5w/wsXRxpMgt23ITUK9DhXCBMi/4v3C6hnZ7dL8d33vz6Cr56lkav6HbyDoPONX5ywi/rS6UA7C58nynVDxQk0+fGMZLJZFZJtHLldHnvUPSa+yF3IBAsdinW9UYNZi0re9WhtjcPf2eM0mlZsPIVm3MJlhyiPGyCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(396003)(136003)(346002)(451199024)(186009)(1800799009)(36756003)(107886003)(4326008)(66946007)(110136005)(8676002)(8936002)(478600001)(2616005)(6486002)(66476007)(6506007)(41300700001)(66556008)(53546011)(6512007)(316002)(26005)(5660300002)(6666004)(31686004)(7416002)(66899024)(31696002)(86362001)(2906002)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1NkejNlNE0weE85TkV6Sm9Xdy9NeGZQTGk0cGl1L2FsR3E4M0tMTkEyZHNr?=
 =?utf-8?B?TlcvYzZPNnB3SDVkSzFyQWh2WGNlU1BrVDVwVEVqRmliMUJOWUx4Y2pXdEp3?=
 =?utf-8?B?Ykoxb2hPM0xEY1BBNlpQNWU2M0planVONzNURm5ISm1KSkxMRFF4eldVakU4?=
 =?utf-8?B?dStQM0ZadEtaUi9COWVFMUF2ZFRLVDBDUURIY3Q3eE9jSTMxYStKMmxKQ0RN?=
 =?utf-8?B?OGNXeTRlTDRhR2pEYkY4b1pucDMrM1o0bFpqZ3V2amdaSHh1LzJuWjROaU1B?=
 =?utf-8?B?MmxPOXNVRlF2ZXVtQm85dmRxVXZ0ZGxJYzUxR2ZKa1lDMVh6QVhZY25WeEFB?=
 =?utf-8?B?UXVpdDZjUzBGeUN2MTFDR2pIbDYxdzNxejZpVjhmeHRCVU9aQ2FzeWpta2ZC?=
 =?utf-8?B?a3dVU2VtYWRLOFg2aXZjZFRYUDc0cXhsN05LcFR0dmlEZ0FkRW5wbmJTeDMw?=
 =?utf-8?B?L3J4SGpKVm1yN1FxSFZ3VlVvRHl1L3V6aTVjQXlCdkJ2dzNuNzVDWXpEbWgv?=
 =?utf-8?B?K0UyTjlkcVhuUFZyeTVkR2JkN0x3MXpXcXhPWEdybUNYVFJxdncvME5HdWQr?=
 =?utf-8?B?cmlHc2VnaXh6Q1pwRXVpdFlNR1BvVUdvVElRVmYxd2FKNkpSZU1sQ2JQQkgv?=
 =?utf-8?B?YUpETlBCcFBLUGdWTUk2YUROYUJzblVzNWxnQXpXeDRCdGJsNFlwbXJ3R2h1?=
 =?utf-8?B?bldXaERBKzMrZ0FvNU9xQmR4dDZteVJhUDc0b1R1ZnVvcjlFMlF5NG10SHJ0?=
 =?utf-8?B?MS94MU9halpNZkFDbXpOcnUxb0NUS05Jd0diMlVSWDJHdlovcjY1WlE3aUVH?=
 =?utf-8?B?a3kvOGJoS3VvNC9xbHV0eFFBM3Q1M3k2SDRXTTBHbE52Zjd1YXUxY3RGMnRm?=
 =?utf-8?B?NnZSczFUN0RXREQ1MCs2QUNXdS9tdHQybXl5bG1YR2hYZ3YwTW03WkRKYVlJ?=
 =?utf-8?B?R2lHNWIvM3IxZC8zaWZ3UEhKMVl6V1pjR2JSZzVtTmpvdGpUdlkrQmFWT2Yr?=
 =?utf-8?B?ejhueW9uK2Z3VDNNZUNxcHlKMEloNjZoY3NaY1lpL1JsSis5WldmeC94Ly92?=
 =?utf-8?B?QjhpUVBMb0djMWo0QkVNcmNqUmo2V2dnOWRFNmkyQnhWNXcyd0ZPVElFVXR1?=
 =?utf-8?B?YmVqZEU2d3dSQkhjTDh5SjRCWWFVZlBjWTkrTzJmWmlWWFQ5Y2YyUG5PQUtk?=
 =?utf-8?B?bXM3U21CVVk2cEZTcFp5Lzl4Q2xZSmNIZXlERUliRGN4SjNFdTZWREQyc2Z5?=
 =?utf-8?B?OVpwdjI1dmx0UUV4citwQWVaYm5DWmNJYnFFZHdNcTdPSTFVckdRZFRTVkFH?=
 =?utf-8?B?SlJhWm9FU0g1U2thU0pBQUgrcnFBSjVzRWlQNkVnU0JweFVYdnRaTndxK1dh?=
 =?utf-8?B?L0lYbTBNV0o1MDRvdnpjbjNLZEtpUDF6b2RWbjY5OTFISlQwZU93dkN1dlIw?=
 =?utf-8?B?RmR2c1cvTzY4RFJHQVNlMGNJVUg1ZytLSDhHMU1oMGUrODdqZllVTXBlMjRh?=
 =?utf-8?B?a2lsWmkyQ2lDNVVrSVh1VC8ranppZXhnYTVtRXZuRTRNVitYUzIrTUJzaGNH?=
 =?utf-8?B?SE9Od2pWQ3BNVEZkQ0JKeUx6c0d3S0pmeEg0Y2xuOWhKNTU4Wjh6Lzk5cGlR?=
 =?utf-8?B?Yk1mOGs1YXhQMktyYkhjN0N6VnNXdW94RlRyZ1Y0Q05KYUVmeHVtN0xlQW12?=
 =?utf-8?B?N1MzYUFBNFFFWjVPT2g1WXpqeHY3OCthN25PaVUyUmk0ZlBRK2t3b3BGM21C?=
 =?utf-8?B?NDkxRUpMbHZjZlduMDdNYlIwam5jbXNqVVA5SEtvSUcxMWQ2L2loQnpWTDNi?=
 =?utf-8?B?dTVvUi95cnkzYXBIQWc0dHlRWlpPeTJHWEJNODlMV3BLcTAwb0U4ZVBYZk9D?=
 =?utf-8?B?N2h5d1UzZ2c5MGM0d1Q4NFZBcmFDc2NOM2l4RzlEUzM3SEsyMzdEVVBLWnpv?=
 =?utf-8?B?UHNYZXNUNnNmSi96ekcwYTBBaTVYNERUU3pmTUpMRzVLQzd1a1dlUlZGYXlo?=
 =?utf-8?B?RWVjKytheS9QNVpab0F6L3I2S1BNRnNwd0hHNjJuck1raDBIRTFjUWNEZ29r?=
 =?utf-8?B?dTFoLzVCeDlkc3ZpRXdONmx6ZWRYYkhQWjBGck5EcmszM242ckYxcVJneDFk?=
 =?utf-8?B?NHZMV2VneTlaTzg3N3p4U1NHLzd4dEdKSzRlS1lvY21HanRlTGU2K1o1cGV6?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b98148-04a5-4c06-1afd-08dbb35ad03d
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 06:38:02.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLYMbbH9STp+G7nm4lVvqtuzhzhFQcwlyVjjh6TsuMm3CTBEqAwLuGNbrcyf1BEzBncuVcF/2TsI7sO/83bikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_233814_478351_9E189C71 
X-CRM114-Status: GOOD (  14.28  )
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

5ZyoIDIwMjMvNy8zMSAxNzoxNywgTmVpbCBBcm1zdHJvbmcg5YaZ6YGTOgo+IE9uIDI4LzA3LzIw
MjMgMTc6NDksIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4+IE9uIE1pLCAyMDIzLTA3LTE5IGF0IDE0
OjA5ICswODAwLCB6ZWxvbmcgZG9uZyB3cm90ZToKPj4+IEZyb206IFplbG9uZyBEb25nIDx6ZWxv
bmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPj4+Cj4+PiBBZGQgbmV3IGNvbXBhdGlibGUgYW5kIERUIGJp
bmRpbmdzIGZvciBBbWxvZ2ljIEMzIFJlc2V0IENvbnRyb2xsZXIKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+IMKg
IC4uLi9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWzCoMKgIHzCoMKgIDEg
Kwo+Pj4gwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLGMzLXJlc2V0LmjCoCB8
IDExOSArKysrKysrKysrKysrKysrKysKPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2Vy
dGlvbnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2FtbG9naWMsYzMtcmVzZXQuaAo+Pj4KPj4+IGRpZmYgLS1naXQgCj4+PiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWwg
Cj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1l
c29uLXJlc2V0LnlhbWwKPj4+IGluZGV4IGQzZmRlZTg5ZDRmOC4uZjBjNmMwZGYwY2UzIDEwMDY0
NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9n
aWMsbWVzb24tcmVzZXQueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4gQEAgLTE4LDYgKzE4LDcg
QEAgcHJvcGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1heGctcmVz
ZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIEFYRyBhbmQgCj4+PiBjb21wYXRpYmxlIFNvQ3MKPj4+
IMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1hMS1yZXNldCAjIFJlc2V0IENvbnRyb2xs
ZXIgb24gQTEgYW5kIAo+Pj4gY29tcGF0aWJsZSBTb0NzCj4+PiDCoMKgwqDCoMKgwqDCoCAtIGFt
bG9naWMsbWVzb24tczQtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIFM0IGFuZCAKPj4+IGNv
bXBhdGlibGUgU29Dcwo+Pj4gK8KgwqDCoMKgwqAgLSBhbWxvZ2ljLGMzLXJlc2V0ICMgUmVzZXQg
Q29udHJvbGxlciBvbiBDMyBhbmQgY29tcGF0aWJsZSBTb0NzCj4+Pgo+Pj4gwqDCoMKgIHJlZzoK
Pj4+IMKgwqDCoMKgwqAgbWF4SXRlbXM6IDEKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJp
bmRpbmdzL3Jlc2V0L2FtbG9naWMsYzMtcmVzZXQuaCAKPj4+IGIvaW5jbHVkZS9kdC1iaW5kaW5n
cy9yZXNldC9hbWxvZ2ljLGMzLXJlc2V0LmgKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLmQ5MTI3ODYzZjYwMwo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysr
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLGMzLXJlc2V0LmgKPj4KPj4gR2l2
ZW4gdGhhdCB0aGlzIGlzIG9ubHkgaW5jbHVkZWQgYnkKPj4gYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtYzMuZHRzaSwgc2hvdWxkIHRoaXMgaGVhZGVyIGJlCj4+IG1vdmVkIHRv
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYyA/Cj4gCj4gTWF5YmUgSSBtaXNzZWQgc29tZXRo
aW5nLCBidXQgc2luY2Ugd2hlbiBzaG91bGQgd2UgbW92ZSBiaW5kaW5ncyBoZWFkZXJzIAo+IHRv
IGFyY2gveHh4L2Jvb3QvZHRzL3ZlbmRvciA/Cj4gCj4gTmVpbAo+IAo+Pgo+PiByZWdhcmRzCj4+
IFBoaWxpcHAKPiAKSGksCkl0J3MgYmVlbiBhIHdoaWxlLCBob3cgd2lsbCB3ZSBkZWFsIHdpdGgg
dGhpcyBwYXRjaCA/ClNob3VsZCB3ZSBsZXQgdGhpcyBwYXRjaCBhcHBseSBmaXJzdD8gSWYgQW1s
b2dpYyByZXNldCBiaW5kaW5ncyBoZWFkZXJzIApuZWVkIHRvIGJlIG1vdmVkIHRvIGFyY2gveHh4
L2Jvb3QvZHRzL3ZlbmRvciwgY291bGQgd2UgYXBwbHkgaXQgaW4gYSAKc2VwYXJhdGUgY2hhbmdl
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
