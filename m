Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBCEC433E6
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 01:37:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB04207EA
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 01:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIu1Nxhf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QdGxd9Wa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB04207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yq947S86a0fVk8iKr7rOeV2jWJuqHePPYTFL2ZlpBak=; b=bIu1NxhfUZhoWNtQaOWQ++JduK
	lOE9npsqA+WCHmLDDJg/2EDp81rQApmaqlflaCbYcUckqHnSaS1i0pOLyQxjnbUXnXR3aP6YzfZgo
	b5msyeFS9eNE06gaGyl1IQ9lNktBigByA0CVY/2fCRDk3s2eQNAJy31eLnIyR3edP3tiVAD8iFrbD
	7l44QXqJrWwmThVUhlVem28YGlwRPTXpwFAiBLX1IKUYp8CSYniJEPMi8zXzUBR5vu8/zETzTtfn7
	cacWOr4DiARiz2eInZ/ZXBZjjISeh3/BCUgie1cdTH68Kzs9qgpInc7YOTQLAFENbfDbWBL+KZDqN
	3kLWfwTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDHhh-0007iT-AH; Wed, 02 Sep 2020 01:36:49 +0000
Received: from mail-bn8nam11olkn2077.outbound.protection.outlook.com
 ([40.92.20.77] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDHhf-0007hX-8t
 for linux-amlogic@lists.infradead.org; Wed, 02 Sep 2020 01:36:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkiFDvOqaw8jOeUmHCiHl77+H7TyU2bKykqE4d58Cdiw+z0MVHNeReV/VH+dSLtaADto4UGQcxiKmFwABjj1qyjisnWViSdffzvBfdXH1TXwxU4Etne5IRSEmanu8dw4+w795+Fgo8HF1+3VNEwNCpZJxUoZo/gFj8p02EV0Aavl9GcJWUJcUEy9OweT5N0JOac9QMsfTCq8U+4SU6dxXqTNdAnRTJW7j+jSDwaMtX0EM2USD3HXrS1RT7nPiFmTbfPI20/XkYoloM4y8wiGeEvk11IJ4KUeSg78fC0Bf6FhvEsNyJp794t5hGZJdqTzx4VIsqZxt3047WKhb9l0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhiEJzwhWOWUPD0YgRvhUEmRArWnw8CDBbcLmZ+zp8M=;
 b=Pt78r2GyNxI4t3+kIqk1mm6quwrF4w7VXnNtu0Bxh58/UtxLWAAqUDLwmMsa2PfIGAj69+cAocBG0czbLPhmNoWTpL6bS52jnxATudqB0SfCguAvaNtR5OR6I+//SYGC7L9wiU0lIwq97wAWleC+44sbPgpmHADghw81E2fAhrCLGPVMxeFeACq8npdwgI668ovQgWNqGAKBWcEt1R7HT6kiLi9DMCQ9EvsV/EIPRHfyNv1yAO21R8oVc0OLTxqq7ekYgnQfdnYu07M6HdoSjrpM2eH5oZ/KBetZUpH1pYugIVHse7LTBtuttI19FX6vMVZyY5nXYzXmwSMzNnyZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhiEJzwhWOWUPD0YgRvhUEmRArWnw8CDBbcLmZ+zp8M=;
 b=QdGxd9WaXForswIEfuokK50ftvhR8oZhqy+cNvUVap27rs5OyFNsV8Wo6Z+90auc7akQ5wlSWx/WjvGZ5A5UiDlIbcILb1kpsZTA4kFxj+v0wfPNC5nPQnlN5qBLouCXutQ7/11f6RGDuSFzGgpcX/YPub3s3pdb5roKBjCqy+vXWfkVuKhL0YBkHyztTDFofQhOSvJ95GpRNRRveOCPVJxtqo2wGUO0qeSrUkAjQc5/ktS5s+pNhZ/TkiaFnmRIchhYxBP4/HhlILShmjHRM6lAIUoaYidczhJkTM/FWfK+HHk6qj/yMDxQv0WsD3h27MnWFPBAC0JcHO7CgP9OIw==
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::4d) by
 DM6NAM11HT212.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::361)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 01:36:43 +0000
Received: from DM6PR16MB3163.namprd16.prod.outlook.com
 (2a01:111:e400:fc4d::4e) by DM6NAM11FT031.mail.protection.outlook.com
 (2a01:111:e400:fc4d::203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 2 Sep 2020 01:36:43 +0000
Received: from DM6PR16MB3163.namprd16.prod.outlook.com
 ([fe80::79bf:58be:21fb:e7b4]) by DM6PR16MB3163.namprd16.prod.outlook.com
 ([fe80::79bf:58be:21fb:e7b4%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:36:43 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: [QUESTION] do Amlogic SOCs support CPU idle?
Thread-Topic: [QUESTION] do Amlogic SOCs support CPU idle?
Thread-Index: AQHWgMkjfzelgBxYAkKRfSSDaCSDsQ==
Date: Wed, 2 Sep 2020 01:36:43 +0000
Message-ID: <DM6PR16MB31634565D792745E3755C6D6CD2F0@DM6PR16MB3163.namprd16.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:BC630B528D6F2E16FB8AA8C7BD976A7D911294F8F158E240B79757EBF7FC3584;
 UpperCasedChecksum:0762B0248E6EA57DDF4F8E07B14613CD68740310DA20D01C2BD845E617EA8FBD;
 SizeAsReceived:6653; Count:41
x-tmn: [0L9gtr4SRSvw+UnI+pzKvw0RkdwORynu]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: dbee4be0-ef3c-4c5d-71dc-08d84ee0a5fc
x-ms-traffictypediagnostic: DM6NAM11HT212:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDQ+XVrQlAm02Y+SJTS449YuPabOz4qiTnmUyivkHhb6z1Hau8u1cc5nzgsbIOAmipuRaB3WF9TsmUU9P/leylOONfxHMd9zrWfz0CvPjTbyw5Ul+PzxvQ4GeDpM/OlaY3hDKNada1EUf8cLsywRw8/koudkZdQaX0GX/fM2hcCGLl5SIGImtdpYKCMUIB8ET181l6uc7TJJEGdHx0BPeg==
x-ms-exchange-antispam-messagedata: yJ9713vabwQhDtZUUAvUE+t3bwR38K3NM51oY58kPyaDPgn5PnIf+563XjNexqDA50StEm+/AcMDvQaxnP2BCcKOTbXewwmMy8eGNOU2i0sprF6NJiaa2DwWrSJ+uriLzfaw0g08Np4kdRU49rsUiQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee4be0-ef3c-4c5d-71dc-08d84ee0a5fc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 01:36:43.6881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_213647_548356_87AD369E 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

just find there no cpu-idle-states defined in amlogic dts, is it not supported, or not implemented?

BR.
Ning.
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
