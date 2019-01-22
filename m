Return-Path: <SRS0=xxvR=P6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F81C282C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 22:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA3521726
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 22:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eojbt7S6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="QRJyidON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA3521726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ni.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:
	In-Reply-To:References:Message-ID:Date:Subject:To:From:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBsSftw6Hz74LAyZmj9MybQguPcNk9a18hA14la3jUc=; b=Eojbt7S6th9xec
	zy2oK2spTKxcZqmammKX3WGuh74Lz/JBHrwo8XHx5NJwfEvoKZvCEbNdIV4qbRUIHYQQ+ES5Vzsro
	Hlj3KP2s7GM9jzImF6U1ePS5BH6ZxIBASt8nj/7cP/W2ECfVx4m1qHPozvIaQitdO15WYFCN7+vHk
	PdWarvpXFbNjyRFUPLQERYiQwAuHV2YQ1fpmlc97lOU270xVZhBaHIUqZJF0yTWhvJhwf+09udZQk
	arD1wd5DO76AqoT9N6Az3wPc8r0LspirPZBKwIuSz4IPW0HfStQKaTzrF+pjH7WSogT5vj1AdG5NO
	DT9xxmXSPcYPp7knuISw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gm4Mb-000679-3U; Tue, 22 Jan 2019 22:17:45 +0000
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]
 helo=mx0b-00010702.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gm4MX-00066i-Ca
 for linux-amlogic@lists.infradead.org; Tue, 22 Jan 2019 22:17:43 +0000
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
 by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0MMGEkd023507
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jan 2019 16:17:37 -0600
Authentication-Results: ppops.net;
 dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2057.outbound.protection.outlook.com [104.47.32.57])
 by mx0a-00010702.pphosted.com with ESMTP id 2q4jnxrsh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jan 2019 16:17:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-ni-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyR2ypFfZy4kgzGNyY+0ytm/iMuEyhaJR9X9BKpKCTs=;
 b=QRJyidONP6W74QnFeY68IN6LCNYcyGiqbdb6DqtvcmzLLnC5JHKzxVu/h923J0BxfmTjvc/K+yH0jR7npzgsQ74ia6G3X+JjOU0EIlOWvC9gYZ9+ZMKoyl4qCsoZXTEIXHZX86lRO1vlFtKsZ1umDRceA4FVQc0/cXKsjt54PHI=
Received: from CY4PR04MB0376.namprd04.prod.outlook.com (10.173.188.141) by
 CY4PR04MB0663.namprd04.prod.outlook.com (10.172.136.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Tue, 22 Jan 2019 22:17:35 +0000
Received: from CY4PR04MB0376.namprd04.prod.outlook.com
 ([fe80::e99c:413e:c244:b853]) by CY4PR04MB0376.namprd04.prod.outlook.com
 ([fe80::e99c:413e:c244:b853%2]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 22:17:35 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [U-Boot] [PATCH u-boot] net: phy: realtek: Add functions to read
 PHY's extended registers
Thread-Topic: [U-Boot] [PATCH u-boot] net: phy: realtek: Add functions to read
 PHY's extended registers
Thread-Index: AQHUrY+gZdrMVzrU0US3s5Zz7G3QHaW75UOA
Date: Tue, 22 Jan 2019 22:17:35 +0000
Message-ID: <CANr=Z=YAR-WusTZv0uGcy2uwTkCtVq+Lw3xEoAe8L95W3TCUVA@mail.gmail.com>
References: <20190116113450.27238-1-ccaione@baylibre.com>
In-Reply-To: <20190116113450.27238-1-ccaione@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To CY4PR04MB0376.namprd04.prod.outlook.com
 (2603:10b6:903:b1::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: AJcUukfChmARUrtrMv6mTVbSCcjdBXkRecydrd4nxRzvvz1iSk6l7FkV
 iVq4LzGsFDi7sCAs0VkwTrTVfPdYM4rDqvQJyKU=
x-google-smtp-source: AHgI3IY26+yB9HbcII16fN45SWm8eucdcd8E4aFQOD3pA2zbONyGWx3KMl5t/MBYkHh/neol9acreD4stzELGYxDuF0=
x-received: by 2002:a24:6115:: with SMTP id s21mr257827itc.62.1548195453831;
 Tue, 22 Jan 2019 14:17:33 -0800 (PST)
x-gmail-original-message-id: <CANr=Z=YAR-WusTZv0uGcy2uwTkCtVq+Lw3xEoAe8L95W3TCUVA@mail.gmail.com>
x-originating-ip: [209.85.166.179]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0663;
 6:ucS+Jdvn4Jvf7EKe8XWA/DG2NbmY1sEeh4kWbH2bWv0yvDjkrSDrH++ws7BePoypKMpRnhdxMnhrS9dzsG0IpVHLWBHGcIIPrXRO5fNvDMGi+/TfaSU9Djy1fju2nK8vHSe0jKnz0YzZYxCfozKejkA5CoMAdjYavWA+FAAEJaAGYKsSLNSIMW6xqH3pp3HWJGY66ZHKCc6pD4wXCspD9uq3Pe6fQrCRfbLz+vFwoHCMUmrMy39u7eTl2ZELRcF768rzHnVp+CpQ60jJymfmXghdbpS0X/TyzYM7zLKglksJkdCoY96yb5KOpjhPcQYz1xIT/+5lzOxel89HK7+NViLUfrAKnh1gEPGv495852MnCxovLq7DJMoAnp9NAQKAZoTs/7llLiucFYtM4XX2TKSQI6e3eJKDXfT3BcU61IXY6gutgHg4hggQr6kc4m8w/o5zwvBKOQRFCsc0ViyIUA==;
 5:8IXjir5pkrkGLltAqvAsDsEMEKY9+bhe2gKXOvPG/Se9MLWFFsL3In1E3tr3haMqDp84ONU/FpXy30mP9rB9O7WQ67Dyb3RWWVTpZ5fFzhRkU7d8hAUTnI3Bv9oVq+esXtFjwrUKMEtyBOfjsjvggrzJ8/kTTPsuUwi39no8xRWHD3oQuO11g6GSCTVzmQDXuxlxxFDh4YUIAM6QHqb7Dw==;
 7:ujq12iQinMqklH4iO1QBjR38OelB4auOQ7+hZlzuS2E9KMj5XKh4drsJb7jNTc6KaOjjRH3eyq0tmPKvX6mnajmqxXuisfvM2uoRrCFqFLqTpv8FBRBVAQez5DYjVWWVkfyZEAG/ww9z0niZRasXgQ==
x-ms-office365-filtering-correlation-id: a465317c-f4c4-4088-a826-08d680b76942
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR04MB0663; 
x-ms-traffictypediagnostic: CY4PR04MB0663:
x-microsoft-antispam-prvs: <CY4PR04MB0663824DBDF22F985147963DF6980@CY4PR04MB0663.namprd04.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(61726006)(61266001)(8936002)(476003)(97736004)(478600001)(6246003)(229853002)(8676002)(105586002)(81166006)(26005)(106356001)(81156014)(6116002)(3846002)(14444005)(54906003)(256004)(486006)(53936002)(66066001)(43066004)(98316002)(25786009)(52116002)(33896004)(186003)(6436002)(76176011)(99286004)(316002)(95326003)(2906002)(14454004)(498394004)(71200400001)(6486002)(446003)(7736002)(4326008)(11346002)(102836004)(55446002)(305945005)(6862004)(6512007)(4744005)(6506007)(9686003)(68736007)(53546011)(386003)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0663;
 H:CY4PR04MB0376.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kbDfXjzA2eSfnVwqLeKb10uevQDNzAi/IWnrd3rEMQ77Qy2BbMwktHVZbDhGfIEABbt4EmVEKxrDUE6Y5+QShfxeH2Ot5fdfZTgl/LXC8J3Z2LZFZCrxzVnfyqZRSjnqT7tK4rVw1GlXl1jxmAMggVYMOHyWN5h2cSUS4yoeQ9Cgm1BQHV+HFw5bp4QpbXJyaAU4umM51dfbNNUEbve+epWxi7qo0Qb81U1YWKhhsFW/eWfKP8kihqdLTa4LxCecYvcTaILxtmlJbNHdKokFiDOCJWfry8+oycZv9qLgkGsgrQwiNqbsAV+8Hs62w0+E/g7v99kaWUGYTzR0LBDKgDdR/qAY1OKFk6WCfDJiQkoZPdVchpXK/tC/hlvtqg1lVLKAIkDaac3uvC7uRuBb8V+aL9d8WxTJ/GivJ0vHxpA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <8C43086F788C9848BF5F7E2ECE8B612F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a465317c-f4c4-4088-a826-08d680b76942
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 22:17:35.2840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0663
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-22_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=801 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901220167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_141741_586968_11FCDD44 
X-CRM114-Status: GOOD (  10.15  )
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
Reply-To: joe.hershberger@ni.com
Cc: u-boot <u-boot@lists.denx.de>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Joseph Hershberger <joseph.hershberger@ni.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 16, 2019 at 8:07 AM Carlo Caione <ccaione@baylibre.com> wrote:
>
> According to the datasheet to access the extended registers we have to:
>
> 1. Write Register 31 Data = 0x0XYZ (Page 0xXYZ)
> 2. Read/Write the target Register Data
> 3. Write Register 31 Data = 0x0000 or 0xa42 (switch back to IEEE
>    Standard Registers)
>
> Hook the missing functions so that we can use the `mdio rx/wx` command to
> easily access the extended registers.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
