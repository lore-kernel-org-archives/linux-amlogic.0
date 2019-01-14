Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBF2C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 11:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFBB205F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 11:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KF2DLtwI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="L//9mKsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFBB205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLRaKwEwYInnmL00XZ4ikRokR/bo5uh9j/Uvqk1tBtE=; b=KF2DLtwIWIzzv5
	k9d2cS3yd/IB3gdk9tAdPXWTjRJNh2RKDARgkWNBTsNxbSgDfCHptDT+6d+xH74wJTtIWfYpGDTtE
	V2InIkUkh4tRInI6kM96cPvr2UK2b2IVswFTaWJDlYQl2C4xLj1PnLnbZIxG+j31HOaOxdlR94+o3
	mIKIU5sZAfeEkUGHg9e1J+f5zOf8+XQth9eLqn1DVGgqoNUQDD9dwA1IoHXp3GUn/j0U1bCFc80um
	RuA/aT7q6W/8Ydaql+gZgwvk352AbR1cCbByxEOVrv6zhPN0A5TWF5tPYPiZ1ZdAqrDZTIgPDDQvr
	ICpsR7r15kCmJS8tKiGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj0Wt-00066X-Ag; Mon, 14 Jan 2019 11:35:43 +0000
Received: from mail-co1nam03on062e.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::62e]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj0Wp-00065w-II; Mon, 14 Jan 2019 11:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGq/Z9aZjUE564PvN1lNGotZ09Xvx6GYxkZp/kiUuzI=;
 b=L//9mKsuW/fKboWZKJbphDR88VDUfZFkbBrWkGUpJ98b6tGN5HK55BVi2IyZQFG1+c0BB6qLowDuP7o8jHs2gofQj+BROoL5QrGYWAdW1uOiAUgUGC7gUM17xhG9YbZbrp/h6ThpzfiLzrzjte+PJ/amMHiIknVVJF0J/H1N7rw=
Received: from BYAPR02CA0008.namprd02.prod.outlook.com (2603:10b6:a02:ee::21)
 by DM5PR0201MB3510.namprd02.prod.outlook.com (2603:10b6:4:77::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.19; Mon, 14 Jan
 2019 11:35:30 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::200) by BYAPR02CA0008.outlook.office365.com
 (2603:10b6:a02:ee::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1516.14 via Frontend
 Transport; Mon, 14 Jan 2019 11:35:29 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
 via Frontend Transport; Mon, 14 Jan 2019 11:35:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54163
 helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1gj0We-00005O-2V; Mon, 14 Jan 2019 03:35:28 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1gj0WY-0003cb-V1; Mon, 14 Jan 2019 03:35:23 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x0EBZBDT021126; 
 Mon, 14 Jan 2019 03:35:12 -0800
Received: from [172.30.17.111] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1gj0WN-0003IU-Gz; Mon, 14 Jan 2019 03:35:11 -0800
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
To: Rob Herring <robh@kernel.org>, <arm@kernel.org>
References: <20190109202934.29304-1-robh@kernel.org>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <59e0d9a6-afee-c3b5-4591-88a0b4aaca66@xilinx.com>
Date: Mon, 14 Jan 2019 12:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(199004)(189003)(478600001)(2486003)(47776003)(23676004)(31696002)(356004)(6666004)(6346003)(229853002)(65806001)(36386004)(336012)(126002)(77096007)(26005)(186003)(476003)(2616005)(486006)(11346002)(76176011)(426003)(65956001)(446003)(64126003)(44832011)(107886003)(50466002)(6246003)(110136005)(8676002)(4326008)(39060400002)(54906003)(58126008)(9786002)(81156014)(81166006)(4744005)(31686004)(63266004)(305945005)(5660300001)(316002)(111086002)(8936002)(7366002)(106002)(7416002)(230700001)(65826007)(7406005)(106466001)(2906002)(36756003)(107986001)(142933001)(5001870100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3510; H:xsj-pvapsmtpgw02; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT063;
 1:E9osKqiy2MyqvAtt0UvAcYm7o74Z/oOnrAJvHq5MUqlU1H1WaBTnYHsHPkuDcVqcckeRUWNZwcIlz1HFJIYdMce3gEMF/t9GmjmEXFm1QNKf6CVr8skO0kkpQ28zBXL1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 325248ca-c629-4072-5ba4-08d67a14629d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
 SRVR:DM5PR0201MB3510; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
 3:NXFXQOzwkAxMat5GsdS34cGE5U7JhJdsOlIjfa6PrXTdtMd7LwGBhoT/7E8bcI+oUlC+MOzdg96R04Jmc9mqQIWzEWdv3wgZjPeS73RVnStpFeaoeT1uMigLrAWY7hhrIctY3C8jQLjqK7KfOdKi7cCbzdf26T9oromFiFhDtB5fHhoArRDBZIkOLGJfJ/N+JKLThFCzm9cg9pcrBEQgQXHqxTsdB4KdnSx02Da1VlmQOnkLNq0qFJJoTB56HXlfI/C585JmNZR/jcTbw6r33YVYrgp8uT2D9PNxqMcA2/vveRkHVhhKz8OuEbCYMBt/LIihIF0RnLKJZ1UrqO7G8RRN8pru2Hl5rZrDRnlAODnb3byEox2kdKM49Mt0/kXn;
 25:+MumYQIsvXxtTfsSMi9Yt3DYKnmx3s9Vz1Fu42Mq6xqfyd1/dLayyjPdwdT/f385inGGjGEK4x+b28OeqMy8liCXrEHG10GghM46XKKyUsUo5vF8ZWspD8LLrmexF9Zqb488+LUyQRFkUPq5tY6Jwiu/qluXOM+mf8W1zRf6rN8gxHpvilVTgB8C+0VW4hwCqoPvJKjZJbt0kC/4GPkzhXOl2ETGfJRdFzLFq+sSdIaQNlLdIzScyplHs56TONc0i6BdcCIWSblD5SXnbiECU29dm5lOPutTfp3myl/sLjMKL4+jOSN5MthW9yg5UiyhYrTdVidPk45sGelzQwVdvQ==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3510:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
 31:0s0830/Y5l34Cp2VX1eAEtbCEn6gBt9gIozlJbOK2Tu1MXD2Xu7GcSxmhwwiIeHnclKy3Hf5obFWq00fAVoX48S06ffzfqSRQ0tFQeFk3DAsX8TAxKzdEr+5JyP/hreouCxyq4+w0vGEC36wXm3SCq5N3yNyiSYcPT5b/z42AiQ7qQw7IMCTk/vK0xnKmNBcxZA0nPGT5qO0TA7i/WkOX0H+rMjj61ThS1IwwOcldMA=;
 20:2voi57SMTwA568Xva1dEwj8koLpgqk7X62ezJmYS/pvdKQLzY/LxvnDhNlhtBPLSL680i2TM8+N+23ol8dF9GlIonyOEauJ8JAH8nn7mHFGnR9vYLJ91gE0V2vHKVKvKr+tprC5H7hHO6ZLb7tMxkV6OcEvw9fOEU5dD9Z0mtbcOTmSTsm28+3PBinMvVOjabiA7bWNGtnf4+t0snHZGzLAVUe9iTBxrYMJ5zR1iRCUBn6v7xJHuUcOF5Ad6djxAA8l5rJWiN2XKgJqlkXwGYsp69pq2w9gJBNQvWu2FH5lF2GA+n38HPwyZeHtWIXoYdBgOAXxQCm3Q708g9p3DJte1FkNro7YSQUjnM/1xskDEzzOcabL7RJwuA3QljJbmmJA8SaTobqj+2Leg8UcX3Jx/gcWfDhYcrNCq/2XEWuoVFbSN+w80XTz706/Kuzf130xFkL9ecRCASiT0y/fhbHp0ROTJnxulTvdWANmcsZhsBkQVJPdR4eSlRLAKApTZ
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3510A398680348A194905D0BC6800@DM5PR0201MB3510.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
 4:L+LXXOMdsDF6OGDv1tSmig3cNZh6zJ8znmHUmdwGvFr6vfyLCEnjrngTZ34ut6ffkvI1KuoZqiQ9c0lGwrhD17RWIFK59BxqVm2H5SVG1BOG49zL/dbxuCKGESyVBU0tM5TMxR+75whPrWzVRD3LZwKbRBmnx+IlJXE1OMsHfytekX4h0IRBo0ugfFoCOsgqgeUmeF2TNawihH0/NHXfyg9T5Plk5du5kshYKgJKnQqh9stpEoDAbGrFxTh7R0bRBmoiw2hOQM/lrVrw2YzP87Lt6BLsdczw0LdWJZtDC7Y=
X-Forefront-PRVS: 0917DFAC67
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAyMDFNQjM1MTA7MjM6VkxJclplcnU2bTRuNCtUNlFXVS9GbjdW?=
 =?utf-8?B?aTIxdjZDRFh1dXlRVy9tZGFSUzc1R0RDMDBFdnBrNGk2d2p3bXFsRkVjMlNl?=
 =?utf-8?B?bEZnTVpQdlFKbmZtTnBCRXF2WWhqOE9VLzFZR3dOK3N5QllFcGoxR3FxTWZX?=
 =?utf-8?B?azBJd1ZlcHQzSUl4UHN6UVdibGxwQXZ0K25ubUE4LzBlZnNuMHMwV1p0ZU0x?=
 =?utf-8?B?Vy9sSEZjTG0zU3JMbmpDNGRuVkNseDFrV3gxdGh1Sk0vVHFpSVJ1bVhXM3U5?=
 =?utf-8?B?VXBSOEljd0NEV2hHdjBuQXBoNDZadC91N2g3WFNjamQrdytjeTB3Rjhwa3M4?=
 =?utf-8?B?d1R0SjdGMzhkYzlQTmE3enFmRkFNdyswUlg1bXpEcVhXL2JVYmdndVBaRTV2?=
 =?utf-8?B?Y0dtazBSS0pYV2szRGsyTEt6TFJpZVRoZDM1aFRqZGc4OExBalRrZjI5OG1w?=
 =?utf-8?B?K05wbjlybzBDMHZ6RitCZitldnV2WTRsODkxbzBvQ0daK2hwSzlQNUtVUUFm?=
 =?utf-8?B?UERBdEpIb0duY205VVRMRHVXZ3ZUMFhLSmtTYmpWMkUwTU8vNk9uc2J4ODlh?=
 =?utf-8?B?Z2dNcHpiRGF6OXJYVS85RW4vYnN2elczRHNlSW0yTHo1SFhMRTFmMHNGbWdL?=
 =?utf-8?B?K1ErUVZleDQ0ZWRaSFVZbTNncDVycXZtR3VtdG1Vb0ZXM3FqejVxMXEydmFn?=
 =?utf-8?B?TlhuVVl5V1dIR2RObWxOZyszeDhleFdXelk2dHdHY1FueWdRRVpFcEVTNlNi?=
 =?utf-8?B?VnVJdFJMVWJnOTJmT2U1ell0dG10OXZ1TmYrL2pGQW1vemU3UW1MY29OOWVt?=
 =?utf-8?B?bnY3WTViNWFRM0pvL3pSWVVJRFlML2Izd3daaHlIMk9GSTBlaWl2d0lTdE1I?=
 =?utf-8?B?NWdUcjhyN3ZRNDViMzJHSkkvakFoUVhBZGN1WlZUQkREeWNXUjJLemtXS0o0?=
 =?utf-8?B?NStwVGVUaThkRWQzc1NNb2kyKzd0YWNnKy9HVlJ5aFlFckxtMzJXeEx4SjhN?=
 =?utf-8?B?T0VPa2dTSTdqMndVV08ycno1Vit6NzJsT0FteXNaY3NlR2VWVWlVWWZTQ2Vz?=
 =?utf-8?B?YUp1aXZjNERrVjJiZ3BlQ2hUY1NCeWpBRVQyNlhxekt4ZkRIeWZ5K0VhdWpI?=
 =?utf-8?B?SytISzBiZnlaaDJlakE3ak5kckhFOWVWajVtaFBEbnorODU1OXZvOVQ0Nm42?=
 =?utf-8?B?K3NKUzRhS1J1OTRXV21BSHJJSlVoTWpWVVBlanNVY1lOeWVoQndLaHBYejND?=
 =?utf-8?B?OStqQVFYbHNFNnFQWXFpd3dPNTN0SlQvR28vd0ZScFBMcHBVZm9CaXp5NnVi?=
 =?utf-8?B?aUgzSGJIUlR5UUJ5T2l2bFNUSWlrRmZ1MmUyb3hSTTlZeUVEMzFibWd6U2gy?=
 =?utf-8?B?NkJESDV6RUVXLzFuQy9vRlJtTnZiUXRmQzdXRFIya1NRSklnazFXQ1EvcXUv?=
 =?utf-8?B?RVhNK21vU09hUW9nUTFTanRlZkxBNjFRRnVlTDBJQm9OQ1dXYS9JOFlRekc1?=
 =?utf-8?B?Tkh4cUg3SU9KTWZpU1ZLcXFTMGM1OWhGMG5uRllKWnl6Q1NQdXZYZU5QZ3ZO?=
 =?utf-8?B?TlBjVjIxWEY4NGhIeUx0dXdIL2dtaThCN1kxYzFhendlUWM1UjVKRmVUTkNv?=
 =?utf-8?B?VWUrdEJQZG84OVdMNVZQTUVUQlBscjlpL1dEY0J2TUJHc2tYdWphSHN2enhm?=
 =?utf-8?B?MTNNVjY3cEVCSHEzVUptaXc1bVVQM3d1UTJXOEhUN0ozd0ZZNHlHN2NZd01j?=
 =?utf-8?B?eFdhUkR3SUpRSkNmd0pvbXhjZTcvRlB1c1RSY2hxK0FRSzZaTFlLaU1vcE9t?=
 =?utf-8?B?NmVnaG56L2FGUmtuZjdZbVVxeWZMZzE0OEhqajc2cWxHZS82dFFLQ1N0bmtK?=
 =?utf-8?B?Wk1tbXUzR2E0STcwRUxDaXBTVUR2TlpGbmlnTnhVV1BMT0U3cVprZTJxcnRY?=
 =?utf-8?B?emdBeWlDQW1zTElBMDUrdm03cjFNTDlSbnprcjlmOVVGZzRpMDhuamhCbTcw?=
 =?utf-8?B?bk9jQ202Zng0NzZ6bCtpTWRIS3ZPeUZna2xHaU9nPT0=?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: d34T16uNjIKGl6LgPCJhOGyYF4VP+cAjl90A2xWuf9J+W6sO5B3VzjshewuHdnepshxyCyzJh0z/xxyxxY2Fk+689KxCTBTzSaRcUj92+MUGw/zvh5LdMfqZF0+DJIsdtEQ6g8z9gfoNQMPY6GHpuTE6uihq6PRoEP+5fTyKuXYyEYT4QsDEO7EqWN3bGJ+CM0YJpu3gcOMnAHpMPy7xS4FRoTiBDuo8Ilf6hOVfHg770RgdD/3L6dzOtaigKtS1GNYzP/GdC8o1v6wqaNPcz/JYMdPqqm2IMw1S+1HtYNE24S3bD8xRcKMGbD+ebYcg8tWKJA7usMqna3158+LhYtbJ4X2CY+tQrIvaNk+khzEtQ2HosPst5HUriazEc4zZggMVg37eMxGUdAOhBynBgDDt5kYG71JWkbggClYirjc=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
 6:bP49rWmVc0eFGAueFfROgXNdz4VfYuBmM6wm/NkSDatpb0E4uXReE4tHZEj27RJCvyM/lc4egP+XgwaBc9ofN96YLoWSEIOvHEmz4ZYaOwGPStUV/k+efGLBCzlmjBBtI+fY+8fZhnPDWGaaGHqa4ONJJ/ygC4iygUWU5aQg3OYFij3YaS4MTcmzrKu31L9eAZdFSf9NsoDhKe/pKwFuqs6TqIj5wGuwqjfD6qsZTdE+Co69zrkN+oAXC3tjmjNUP+QwQ7IpYySHY2SlQBjNbK5MMe/FcEop/ZZYfODPBkpA4dakcE1I9BdSZOV9bDs293O9y3pAnlJX1GjRc2d+UY4oOdqHXk3Jp8bcwCGQjifWXWuxV5GqS+aujNuySPLCAGGhArCgwwKj9qZTIE049Ip9oiWvGo+ED6/SK7FZ1RXn08dL1X7GG5zZq0HPpXT7z/4ivJmoyZ2T8ryGTmp/PA==;
 5:5Iv/xj3RtYLszzQDDbu4oNTpCqDmIdCOd8PlAa0cpGn9U9pNcA1fDUqdQJApEwzcX+s8N0xh14Il6yR89IOLJoo0sJaWP3SjwPGQmBRr1X8WlwIqM5WeHI57hK0a/5GXbkzFANGiS8/isXD/lwZzOh5dy9yQ4R/YjeujhUOCwo0j2EqFiZHLQPi19B+bXQiQvnplSZHXunh/NVnfy+VE1g==;
 7:YaThfV/XZZ6fMH+3Lac03UcLql1xvxNy2lxJxB1HB7CV72gpim98nKxNG3kcoP3knR3Y5nWdGEoRGS3VwNnN/BkIVYiHj40mEMDZ60EQ8qQ7CgU+DPV460vIiuSo5PI6M+u4T/7D5RJHHW1VjpEqKw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2019 11:35:28.8011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325248ca-c629-4072-5ba4-08d67a14629d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.100];
 Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_033539_658707_75AA5C3E 
X-CRM114-Status: GOOD (  15.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09. 01. 19 21:29, Rob Herring wrote:
> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.
> 
> This fixes warnings generated by the DT schema.
> 
> Reported-by: Michal Simek <michal.simek@xilinx.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> armsoc folks, Please apply directly.
> 
> Note that there's still a case left in msm8998 that needs a new 
> compatible string.
> 
> Rob

...

>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   8 +-

For ZynqMP.
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
