Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DACFC10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2D82084C
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VoegUYfs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ErlUKb5A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HnfvpJbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2D82084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jPONU68kFxxlWkAF2m6Y5CHGskr6HUZxu0lxTyTA90=; b=VoegUYfsQZP6AB
	vksVRgiEWXZerL1bI+Fnk/73DUz93WH0RYi9SIkNa1QujXjScnE3EJTkNGFvhTEr+3D72tQ7JfZyY
	N/4Ew8Rb8kfq0lsnUVIYD3APA2tXQRThwXAxPnQT7Z2FaCFyya6mX8j5xwcQBdop2EYxn8dT7eb91
	jCbP32sX0Xw7tuheLY1cXtZPoxxQhjsnog98cRgo/4oPG1v0TYsD6mmn956ElLvVHxnqzxIz1Lc87
	1ACdffKO2NyV/j243WAPMyOyJQq7kXaTELlQ+csJr9ecq8y6Oe9nMF3RsFZAx7zO5dR0DQ0R+JZyw
	oaIpDOOS2yTO/TncV+pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDnAf-0003kD-HF; Tue, 09 Apr 2019 09:36:01 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDnAb-0003jc-Rw; Tue, 09 Apr 2019 09:35:59 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 7C9C710C1762;
 Tue,  9 Apr 2019 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554802557; bh=Nj5Y3O0f1auxfnX2U3agh8HoXAwkHgqMJX20H0XZOyU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ErlUKb5AY28dLqsXCiBPBH2fe4SilEfzcixoBD2yCMldg5cxrG2CF7r+9f4GYWAlQ
 Ozd2ES+3AAUPzwE83R1v377qedM250jh7BuRmkSDEA4c/9UuaiPCeS3+M/GNHnmZ5F
 4Yjs8M4fWbhh6x9qU+zcBYitZc2sSdqL3NiI+Nn52OdG+7AitdprD93gqHkLVZZTXX
 atBpD8gN6Bbfgg/bMW0X6NwTRiijsoxp/5NtidCI2rJIR9PZW3VkdY4Vw0xR+y7PQA
 lcspQOVHxSGTOXYHJZKImOp3zQeHMfJCphnb9Dzn/yfzGOtlm3alybigFAiCGSx27R
 bDN5exn6vFCBQ==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9ABCAA005D;
 Tue,  9 Apr 2019 09:35:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 9 Apr 2019 02:35:55 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 9 Apr 2019 02:35:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj5Y3O0f1auxfnX2U3agh8HoXAwkHgqMJX20H0XZOyU=;
 b=HnfvpJbk6DGimdLp2AQrZrauZ64nnRQUHie/QxOAcWabt2O1teUg2uoYKmAqSt2mQWtfz4cQ0k7bvVU6/WBezBzij5In13G8HFT+xK3r/3XgYgrlx+LtVpad6ZCdbAfxf/YEuI0F3jHlgYj0ifEY4qfNbA6s0UZz4tchVCs/jEE=
Received: from BN6PR1201MB0082.namprd12.prod.outlook.com (10.174.113.147) by
 BN6PR1201MB0034.namprd12.prod.outlook.com (10.174.113.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Tue, 9 Apr 2019 09:35:53 +0000
Received: from BN6PR1201MB0082.namprd12.prod.outlook.com
 ([fe80::4d0f:ceb2:da99:6777]) by BN6PR1201MB0082.namprd12.prod.outlook.com
 ([fe80::4d0f:ceb2:da99:6777%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 09:35:53 +0000
From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "minas.harutyunyan@synopsys.com" <minas.harutyunyan@synopsys.com>,
 "balbi@kernel.org" <balbi@kernel.org>
Subject: RE: [PATCH v5 0/8] arm64: meson: Add support for USB on Amlogic G12A
Thread-Topic: [PATCH v5 0/8] arm64: meson: Add support for USB on Amlogic G12A
Thread-Index: AQHU4u6ynqUFfNSZZkWd0BG/HbGZRqYyF7mAgAGRb0A=
Date: Tue, 9 Apr 2019 09:35:53 +0000
Message-ID: <BN6PR1201MB008229C7533782DEC3E8036DA72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
 <76726909-8395-666a-a96f-c9b8712b12b2@baylibre.com>
In-Reply-To: <76726909-8395-666a-a96f-c9b8712b12b2@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYUcxcGJtRnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RaRGN5TW1ObU1qa3ROV0ZoWVMweE1XVTVMV0ZtTUdFdE1UQTJOVE13?=
 =?utf-8?B?WVRGa1lUSmtYR0Z0WlMxMFpYTjBYR1EzTWpKalpqSmlMVFZoWVdFdE1URmxP?=
 =?utf-8?B?UzFoWmpCaExURXdOalV6TUdFeFpHRXlaR0p2WkhrdWRIaDBJaUJ6ZWowaU5q?=
 =?utf-8?B?TTRNQ0lnZEQwaU1UTXhPVGt5TnpZeE5UQTVOelUyTXpBMUlpQm9QU0ptVDFC?=
 =?utf-8?B?cVpDOVRkU3RPTWpkSVNsYzNWUzh4WkhSQ1NuVjNhVlU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVU5TVUdKaFpYUXJOMVZCVW0xV0wzaFlRM05ZVkROSFds?=
 =?utf-8?B?Z3ZSbU5MZUdSUVkwOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZEYTBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVROS1JIbEpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
 =?utf-8?B?VUZCUW0xQlIydEJZbWRDYUVGSE5FRlpkMEpzUVVZNFFXTkJRbk5CUjBWQllt?=
 =?utf-8?B?ZENkVUZIYTBGaVowSnVRVVk0UVdSM1FtaEJTRkZCV2xGQ2VVRkhNRUZaVVVK?=
 =?utf-8?B?NVFVZHpRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdk?=
 =?utf-8?B?QlFVRkJRVUZ1WjBGQlFVZFpRV0ozUWpGQlJ6UkJXa0ZDZVVGSWEwRllkMEoz?=
 =?utf-8?B?UVVkRlFXTm5RakJCUnpSQldsRkNlVUZJVFVGWWQwSnVRVWRaUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZhWjBKMlFVaFZRV0puUW10QlNF?=
 =?utf-8?B?bEJaVkZDWmtGSVFVRlpVVUo1UVVoUlFXSm5RbXhCU0VsQlkzZENaa0ZJVFVG?=
 =?utf-8?B?WlVVSjBRVWhOUVdSUlFuVkJSMk5CV0hkQ2FrRkhPRUZpWjBKdFFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJTalJCUVVGQ2JVRkhPRUZr?=
 =?utf-8?B?VVVKMVFVZFJRV05uUWpWQlJqaEJZMEZDYUVGSVNVRmtRVUoxUVVkVlFXTm5R?=
 =?utf-8?B?bnBCUmpoQlkzZENhRUZITUVGamQwSXhRVWMwUVZwM1FtWkJTRWxCV2xGQ2Vr?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlowRkJRVUZCUVc1blFV?=
 =?utf-8?B?RkJSMWxCWW5kQ01VRkhORUZhUVVKNVFVaHJRVmgzUW5kQlIwVkJZMmRDTUVG?=
 =?utf-8?B?SE5FRmFVVUo1UVVoTlFWaDNRbnBCUnpCQllWRkNha0ZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJRVUZCUVVGQlFVRkJRMEZC?=
 =?utf-8?B?UVVGQlFVTmxRVUZCUVZwblFuWkJTRlZCWW1kQ2EwRklTVUZsVVVKbVFVaEJR?=
 =?utf-8?B?VmxSUW5sQlNGRkJZbWRDYkVGSVNVRmpkMEptUVVoTlFXUkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZDUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnRRVWM0UVdSUlFuVkJSMUZCWTJk?=
 =?utf-8?B?Q05VRkdPRUZqUVVKb1FVaEpRV1JCUW5WQlIxVkJZMmRDZWtGR09FRmtRVUo2?=
 =?utf-8?B?UVVjd1FWbDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJtZEJRVUZIV1VGaWQwSXhR?=
 =?utf-8?B?VWMwUVZwQlFubEJTR3RCV0hkQ2QwRkhSVUZqWjBJd1FVYzBRVnBSUW5sQlNF?=
 =?utf-8?B?MUJXSGRDTVVGSE1FRlpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZEUVVGQlFVRkJRMlZCUVVG?=
 =?utf-8?B?QlduZENNRUZJVFVGWWQwSjNRVWhKUVdKM1FtdEJTRlZCV1hkQ01FRkdPRUZr?=
 =?utf-8?B?UVVKNVFVZEZRV0ZSUW5WQlIydEJZbWRDYmtGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFVRkJRVUZCUVVGQlNVRkJR?=
 =?utf-8?B?VUZCUVVvMFFVRkJRbnBCUjBWQllrRkNiRUZJVFVGWWQwSm9RVWROUVZsM1Fu?=
 =?utf-8?B?WkJTRlZCWW1kQ01FRkdPRUZqUVVKelFVZEZRV0puUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVoTlFWbFJRbk5CUjFWQlkzZENaa0ZJ?=
 =?utf-8?B?UlVGa1VVSjJRVWhSUVZwUlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVGQlFVRmpkMEoxUVVoQlFX?=
 =?utf-8?B?TjNRbVpCUjNkQllWRkNha0ZIVlVGaVowSjZRVWRWUVZoM1FqQkJSMVZCWTJk?=
 =?utf-8?B?Q2RFRkdPRUZOVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZD?=
 =?utf-8?B?ZWtGSE5FRmpRVUo2UVVZNFFXSkJRbkJCUjAxQldsRkNkVUZJVFVGYVVVSm1R?=
 =?utf-8?B?VWhSUVZwUlFubEJSekJCV0hkQ2VrRklVVUZrVVVKclFVZFZRV0puUWpCQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFV?=
 =?utf-8?B?RkJRVzVuUVVGQlNGbEJXbmRDWmtGSGMwRmFVVUkxUVVoalFXSjNRbmxCUjFG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlEwRkJRVUZCUVVFOUlpOCtQQzl0WlhSaFBnPT0=?=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [92.123.244.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 634ea7f6-9122-4858-c853-08d6bccec2d6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0034; 
x-ms-traffictypediagnostic: BN6PR1201MB0034:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR1201MB00349E2385EDE6A95B6DBB71A72D0@BN6PR1201MB0034.namprd12.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(396003)(346002)(39840400004)(199004)(189003)(476003)(256004)(316002)(6116002)(14444005)(99286004)(66066001)(3846002)(11346002)(19627235002)(446003)(86362001)(76176011)(478600001)(102836004)(26005)(53546011)(71190400001)(71200400001)(2906002)(2501003)(486006)(6506007)(2201001)(966005)(25786009)(110136005)(229853002)(14454004)(52536014)(7696005)(5660300002)(97736004)(186003)(105586002)(33656002)(106356001)(4326008)(81156014)(6306002)(9686003)(6246003)(55016002)(8936002)(6436002)(54906003)(53936002)(305945005)(74316002)(7736002)(8676002)(68736007)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR1201MB0034;
 H:BN6PR1201MB0082.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iJdXRsbVBHyykhczgKavjJCZnDtviiQyhqjmLkIrDf+VJiszjixtrB4sOPY15BHIlTHQdiaKo6aH++JvSHAjvTWu6lZi2rHlCftMmpQ+rmFeijxjNY+AtWh46n3fze8otOIAPuZJcCkpLB60Lyf6ifg7sXZ5NyKluG6VAs66ATlJ32tVoVBE+gw4WDtmNi5NVbaBYbzHWJ1U5xScIKf1B8Klnh0RtaWLUdrsxHzIGdPZ7+v/Fw5L+L4yu2zr0wv7moFdpAo+7vxeo/wcjGcy8U6PJkNO4s1WRhjjb7sUZI+nHm2MobUIUC9RHrbtKqcLLxg8HYToYWRACxJ1VpLqL2t3/O6tNZqJp8aRV10SJHu9i3VHeVMqOUaoPCZSEgvVf04dlvPRuWVuwVXg8mrlGjb6lMeqxLxafpkVCr2NIYs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 634ea7f6-9122-4858-c853-08d6bccec2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 09:35:53.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0034
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_023557_916612_1DC3C0C9 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kishon@ti.com" <kishon@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,


> Hi Greg, Felipe, Minas,
> 
> Gentle ping about these remaining patches, who is supposed to pick them ?
> 

I set my Acked-by tag to dwc2 related patch: 
[PATCH 7/8] usb: dwc2: Add Amlogic G12A DWC2 Params
Other out of my responsibilities.

Thanks,
Minas



> Thanks,
> Neil
> 
> On 25/03/2019 10:39, Neil Armstrong wrote:
>> This patchset adds support for USB on Amlogic G12A SoCs.
>> 
>> This patchset is composed with :
>> - bindings of the PHYs
>> - bindings of the USB Control Glue
>> - PHY Drivers
>> - USB Control Glue driver
>> 
>> Device Tree nodes will be added in a separate patchset.
>> 
>> The Amlogic G12A USB Complex is composed of :
>> - 2 USB Controllers :
>>  * DWC3 for USB2 and USB3 Host functionality
>>  * DWC2 for USB2 Peripheral functionality
>> - 2 USB2 OTG PHYs, only a single one will be routed to either DWC2 to 
>> DWC3
>> - 1 USB3 PHY shared with PCIE funcionnality
>> - A Glue to control PHY routing, setup and OTG detection
>> 
>> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, 
>> including routing of the OTG PHY between the DWC3 and DWC2 
>> controllers, and setups the on-chip OTG mode selection for this PHY.
>> 
>> This drivers supports the on-probe setup of the OTG mode, and manually 
>> via the USB Role interface. The IRQ mode change detect is yet to be 
>> added in a future patchset, mainly due to lack of hardware to validate on.
>> 
>> Changes since v4 at [3]:
>> - remove remaining phy_put/clk_put() of patch 8
>> - handled phy_power_off/on() in suspend/resume
>> - Collected review tag on patch 8
>> 
>> Changes since v3 at [2]:
>> - Documented and replaced magic values in USB2 PHY driver
>> 
>> Changes since v2 at [1]:
>> - Collected review tags
>> - Removed syscon.h in usb2 phy driver
>> - Added comment on the USB3/PCIe switch
>> - Renamed dwc3_meson_g12a_usb_init_mode in glue driver
>> - Changed indentation in dwc3_meson_g12a_role_set
>> - Switched to of_get_compatible_child in glue code
>> - Added devm_add_action_or_reset() to disable clock in case of probe 
>> failure
>> - Checks priv->vbus before enabling regulator
>> - Switched phy_init/phy_power_on
>> - Removed priv->phys[i] NULL checks in suspend code
>> - Removed clk_disable_unprepare/clk_put in remove code
>> 
>> Changes since v1 at [0]:
>>  - USB2 PHY Bindings: collected tags and updated commit log
>>  - USB3/PCIE PHY Bindings: collected tag and updated reset list
>>  - DWC2 Compatible: collected tags
>>  - DWC3 Glue Bindings:
>>    - removed clock-names and reset-names for single entries
>>    - removed ports graph for PHYs and replaced by phys list with phy-names
>>    - added dr_mode and optional vbus-supply
>>    - fixed example
>>  - USB2 PHY Driver: removed USB_SUPPORT and otg.h include
>>  - USB3/PCIE PHY Driver: removed USB_SUPPORT, fixed comment and unused 
>> reg variable
>>  - USB Glue Driver:
>>    - Moved debugfs I/F to USB_ROLE_SWITCH framework
>>    - Integrated USB Glue Control Registers offset
>>    - Removed of graph parsing to use devm_phy_optional_get()
>>    - Fixed PHY mode handling and OTG switching
>>    - Simplified PHY calls by removing the NULL test
>>    - Added optional vbus regulator handling
>> 
>> [1] 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r
>> _20190212151413.24632-2D1-2Dnarmstrong-40baylibre.com&d=DwICaQ&c=DPL6_
>> X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=JpHS
>> pNXFOjqz2mQIFEbLclNsBGFFLrjgWzl5raSOnY0&s=IgoSa-bVc4LdJUXwO5emFfIsnHAf
>> M5rDvLwaAzOiZSA&e= [2] 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r
>> _20190304103846.2060-2D1-2Dnarmstrong-40baylibre.com&d=DwICaQ&c=DPL6_X
>> _6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=JpHSp
>> NXFOjqz2mQIFEbLclNsBGFFLrjgWzl5raSOnY0&s=xlNfpSTqe4BX8SRvs-QGbvQ69FRPm
>> 6FYPn2XtP7aTtQ&e= [3] 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r
>> _20190318101153.7531-2D1-2Dnarmstrong-40baylibre.com&d=DwICaQ&c=DPL6_X
>> _6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=JpHSp
>> NXFOjqz2mQIFEbLclNsBGFFLrjgWzl5raSOnY0&s=cJJQpmMW7S91S_77ss6Fz2Cx03jKl
>> Pm2j8rE4jIu_gw&e= [4] 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r
>> _20190318132655.30040-2D1-2Dnarmstrong-40baylibre.com&d=DwICaQ&c=DPL6_
>> X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=JpHS
>> pNXFOjqz2mQIFEbLclNsBGFFLrjgWzl5raSOnY0&s=IMfKgW_qvqj1gtwuPAy1AqiaNB5y
>> 0PVUphQdJ3UvryY&e=
>> 
>> Neil Armstrong (8):
>>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>>   dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY Bindings
>>   dt-bindings: usb: dwc2: Add Amlogic G12A DWC2 Compatible
>>   dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
>>   phy: amlogic: add Amlogic G12A USB2 PHY Driver
>>   phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo PHY Driver
>>   usb: dwc2: Add Amlogic G12A DWC2 Params
>>   usb: dwc3: Add Amlogic G12A DWC3 glue
>> 
>>  .../bindings/phy/meson-g12a-usb2-phy.txt      |  22 +
>>  .../bindings/phy/meson-g12a-usb3-pcie-phy.txt |  22 +  
>> .../devicetree/bindings/usb/amlogic,dwc3.txt  |  88 +++
>>  .../devicetree/bindings/usb/dwc2.txt          |   1 +
>>  drivers/phy/amlogic/Kconfig                   |  22 +
>>  drivers/phy/amlogic/Makefile                  |   2 +
>>  drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 341 ++++++++++
>>  .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 413 ++++++++++++
>>  drivers/usb/dwc2/params.c                     |  12 +
>>  drivers/usb/dwc3/Kconfig                      |  10 +
>>  drivers/usb/dwc3/Makefile                     |   1 +
>>  drivers/usb/dwc3/dwc3-meson-g12a.c            | 604 ++++++++++++++++++
>>  12 files changed, 1538 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>>  create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb2.c
>>  create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
>>  create mode 100644 drivers/usb/dwc3/dwc3-meson-g12a.c
>> 
>
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
