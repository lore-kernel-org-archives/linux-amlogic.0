Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BAC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7B260EE6
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 02:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D7B260EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I2+cWo13cyvbKVWXmY4VFvsGW9YLcjMVSjiPuOo1XUg=; b=rw1RkegH2q0FYc
	JmkBCBQNWYbItPp2KBOdBgpWJbSwKNEcoQc934WstuXwj4tXbJRW5jnkpQhU8Uvt53+JfVGfPYm21
	dU3KCydrWP55FCkOgMICKyePz7Y+NP6dcyfUaMS8txYUiemkBKtNyYL0/nE8uMgeekr9MOz9tDHIp
	RTg9Axv+UyTZOJGFjz0/DIDfjG8LlWYRttrJEZ8t6VfE9yNeeRhjv7rp8A+57uWQl49iMrz81ohEL
	3UJ+9Mzo3hSceQ599ZJEP/02KrUCYwcKt3U1UJPWYICjeIBgGExpe/6tycy/9oiY7pldcowEZhd0h
	JzBJImlt4LuA9RMN7zcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vqK-002uvC-4z; Thu, 29 Jul 2021 02:32:16 +0000
Received: from mail-oln040092255107.outbound.protection.outlook.com
 ([40.92.255.107] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vqG-002utu-KX
 for linux-amlogic@lists.infradead.org; Thu, 29 Jul 2021 02:32:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/gmZYnh9JPHs/V/4AcoS3K3sk/V0lfH7ViFqyeVa+ynYH1NVHO8oe7bCApoyTDEUWSe1UoN+yx8MKhtf5zsVhHpyni/AzlfqCh87auxN849RMCM5NxmQJ1aQcjBgUNKzeSczArWNN1Mou9+mlLdoG3RFXEbkOl1yXEBI6a/RFGQxsdbqsET+B6SGqDMZpve09wcMrcwocFbGMiZWbOXzFQ7i+bsM4MKTGOuYCXEM9K0Fgw1YT/BrzK8fB/+ZZqUrsI4Wkp20po7WX16jAcDZ0CW/Iv/haL2M87EJPsjYH7pJJ/MM1ErnYiBCUhTZvbtdVoLxdNQdrEff13AxSO86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taPJKfWGZgMZI3Bn5YmCd2re8Wn/RbgaOVFCHxIlE6U=;
 b=ICduzE/Jc1LzTej/sMwIjNDgOCxjaDNg27yX9l+qhuvpxjHfUW3IF1hybtB41n2vRUJazZe60tVl0uBpaYUHtVfIL+/TsWD6wvO8QxSX2P/Zc4Ykf3NactSVL/MSsRws1ENvrjnP+H3sBcIBfdYA2ZcPksN/Pd4VrK0o8TDaFB7WkxuX93nlYVyn99wDT2FY8DThk0kxTsGFZXzq+/jIfasO+1j7Y86tLccEbG397TpJNv6TToOid9/5nE1nUw0FPfdnKU74jX6e4+6Nj+Qw1IQO4usgwjnhM/CSMJX8lUD4XB2m/GvpW1UGcG5qwOj8S41gNvolnvvesDG6s4usQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taPJKfWGZgMZI3Bn5YmCd2re8Wn/RbgaOVFCHxIlE6U=;
 b=bnVKCiksuSxmjeL18YBiRPCm/Q1UdVgQEEvZmCLZuNmola8/yI8ojJa2fu1Tk4xnmXlb77dfHhwwUpAswYSXWY7CyB9fxqbrlbubj7OMTpU2d4dXIFPXKSnGnheLJx9c4hfxjxlEqOC2ENzaHwhnXFJMbr03532Ft6xpjeI6ayeSAdy/edB/knN35dN0tmm8rmU1oWU7mGHYCAslFC7Lax/tNmxe/DUV2/LMoZ7vrrs/Sc0t+yuwAgIhv0SpKAl+xGkD6B58IAc8EGxCZZ5DtW8IRxU7ZPKp1088ROAlGnnHfZVao9oIJI/gGb3Wt/yveaJtejTXM4O3/TccDYA3lw==
Received: from PS1PR0401CA0060.apcprd04.prod.outlook.com (2603:1096:803::28)
 by TY2PR02MB3566.apcprd02.prod.outlook.com (2603:1096:404:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 02:32:05 +0000
Received: from PU1APC01FT111.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:0:cafe::98) by PS1PR0401CA0060.outlook.office365.com
 (2603:1096:803::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 02:32:05 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::4c)
 by PU1APC01FT111.mail.protection.outlook.com
 (2a01:111:e400:7ebe::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 02:32:05 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::95a3:d18e:eef3:cb39]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::95a3:d18e:eef3:cb39%8]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 02:32:04 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: does A311D supports SCPI?
Thread-Topic: does A311D supports SCPI?
Thread-Index: AQHXhCBaX4KfNfhEsU6RE/AMot0bOQ==
Date: Thu, 29 Jul 2021 02:32:04 +0000
Message-ID: <OS0P286MB0641C5CDF6A9A92CBD324E1ACDEB9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:43F13D63DD1B5BB7396E6C15D07F7D8982C8CF3D7102BFC4A6A7EF144EE0C954;
 UpperCasedChecksum:43557980F939BFCED8C3ED4CBA6EBC448EE48D588E1BCE0593592BB35D67068B;
 SizeAsReceived:6637; Count:41
x-tmn: [Vk0kkOwUb3wYHiJ5Avu7QNv6DfLyLQ4d]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 5b0b984c-7d6b-4525-74b4-08d952390ddf
x-ms-traffictypediagnostic: TY2PR02MB3566:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pzQbaNQ7sNghNZtSlFVQJrTWjZdAFsjfo6U/RnaipptCgsHeRxgR9SpKBbY5mF+EUoM/WxVIT3ZJT8+XITVDEcD2rdiUbH0cvaX/KBbnbRmsaAIdmSMAn04V4KFEfj1E9kLeC+eI8NyLsSqrxilFVADFVVvz8JJR3saQ+EPt8v/8BOxmTaq4hvGC4tpUnozLoTNwP1e0a8jG9SfAhYTSqkRjPRDKsNYa/TiIWJcooGZktfKy/LkZI2P2VNcj0pJe78ziUZ0KhCe+gLcEGnjWxh3sBavrvjR4PxhLRu2Tk6LJR3JYc9LDgMMe8/cZQp8d1FZKK4fjDDsiV1O7QypR1dZ4pSuJJQwR8A+/yj6gOGdtAoXtHCRMLNOaXVBAdephh3FPUaUltOnT5CjRgw5hiuzLEG67wmr4D0DXIixUQj+FykmqAImfaku/dTn1IbqeWeSt/El8osqoAArmRdUYbCX5psp9/Y2clrP17DKKdT8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: w4qantZCNtjT6PhWHXsFTgO4hAKvyZipN5YoyC/EUFp3vSE7GGF8ocWgWDyaofVRkkK9noGHecVxz2tm1x4pM7h8nFpkp00HyEjLMYEWPWL9yHlt+11iQOGfIxzkATv5D+J2VzGtIMzN2tOasxXLNg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT111.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0b984c-7d6b-4525-74b4-08d952390ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 02:32:04.8519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB3566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_193213_184534_E21CDF5B 
X-CRM114-Status: UNSURE (   4.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

when I'm building minimal kernel config for A311D[1], and find A311D doesn't support SCPI.

and I tried to find answer in A311D datasheet, but no answer.

is SCPI mandatory for Aarch64?

if yes, what's the status of SCPI in A311D?

BTW, what about cpu idle, any progress[2]?

BR.
Ning.

[1] https://gitee.com/zhangn1985/config/
[2] http://lists.infradead.org/pipermail/linux-amlogic/2020-September/008044.html
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
