Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C946CC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC552078D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POoPz77N";
	dkim=temperror (0-bit key) header.d=outlook.com header.i=@outlook.com header.b="hHytH1mb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC552078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xr15UvU5dQWA7vp3O15KnkFItwZ4OILj0bDO1aCsPU=; b=POoPz77NKr0yS6YhwNyJRJJK8t
	At2bW7pfgQmtvnUQqm5K1p4CpTdMYu+VQW5i1E5gL68roBUes/hEybIdzasfXb0iHlCcYbVQHcfDM
	wzrrdL8YM2Jc7JakB4Q+EVHLxK/LRMivL6g+shsmULFownrbJo+xE6CU+0FOdJ3z5ayzTbubd9FMw
	IZjlCmgwBsDtmlt5NX7I5bkhzQiWBQalOusb1RDynFpYWcas77WZIqmVxM8Y6cE8shdAVaaNkVKtD
	MVKHA8/3+jSqjDNOPmZ2vPqwp6Nx2+cy8lN/EEabV+WwRHhwOgfOEjVq1ln19vO2Koo58WGlmdMtm
	fkonSktQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPpT-0003IF-Sb; Mon, 05 Oct 2020 12:42:59 +0000
Received: from mail-oln040092253080.outbound.protection.outlook.com
 ([40.92.253.80] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPpS-0003Hb-4v
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 12:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jetqqU0tT/K4k3+KxTcBKdXDqkCqviUMOZiV4pgACWeY0A0UtarK/YQCn8Ll2+LcFp/7mkEDyrWLjyzxTzY8jaWEgAllajslOsJ0U48xY2goDWqyknGx1Jpf4Fk/RFB66iXEpK3pdMtG754FX3Jgu/nSUtwF5E/RH3w3aUrCCDDVkDmHL4M5K3nYFTZdpas1NK/IJ4rackg494cyiRSHw7OnttY9K255Led7MmFG10cq/Bw018JC9XxIIg0U6FMVClos8Fe78Kjb51mjVegEnDP+tDNujm8tVrwj+pQuenb0a88Y8kwBYSusk9XkO0VJOe650BRcxvUY0ERo/qpTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QT+HtWQ3QDsjbMiAoGORGFAgCwj7xLD46Sy4t0xYG2g=;
 b=EK/QJfzIFDZoacMdsm3GqoAyv6dGzqWNtAHcMrNfmEqnvj7dapreRYO0ZOz0kRZWlHJsTNxurcxNxlThk7x9rVx4+sWVdblALytyra01xtZcejOj0L/bYsAaGfcfupRhXBdO8X2fdOFTqcWfuGP60nyTptNjh30IkNrl4toTqOhOdaXMvSS3cdzCIp5cFgafPmcVrDEQ1E6R6jIavgDlZ3to9xt9MDRuttUk+GHyOXonAbBBqfxDH5FKGlHQfEdw2e7tnCUYL/mhP0G5Qwuynf1VP5j3UkMe8yaF2gE0g6YLGM1BszbsFvSvEZFLXsLzYHorvBVR1B4AcnAsNSoKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QT+HtWQ3QDsjbMiAoGORGFAgCwj7xLD46Sy4t0xYG2g=;
 b=hHytH1mbmK/o2MffGdBuH8mRFtmwEWFU/M6upjc/rUh72HqbwDLJDVhx0BMWpFxEr+ttKwpGGDw8Bxm1HKZleO+SxbrQVhJyDbsuMw/99ydc5vXZ2ubVCVwuc3oLw7NsSes9Ip+imG7NA4gaHYBc/0nOCWyXLMAKcCyY+13My9ZcsIV1GfeKHS1ScSap0NGDzLiyXYpkYBCyB539wjMjWFnSujfUsg1fByEb3FX4tHqHbKPUeCBxb6AGAt9GNzMyDT0oB3aplicH8AB/53+cHpVMc/x47nYWRdbGTEtOFx3x8C/HGwYAbJHkTStfbQUT3KluaXEkoRuSZGyh9BQIiQ==
Received: from PU1APC01FT007.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::40) by
 PU1APC01HT183.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::454)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 12:42:52 +0000
Received: from SYCPR01MB3776.ausprd01.prod.outlook.com (10.152.252.53) by
 PU1APC01FT007.mail.protection.outlook.com (10.152.252.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 12:42:52 +0000
Received: from SYCPR01MB3776.ausprd01.prod.outlook.com
 ([fe80::861:b63c:843d:56c6]) by SYCPR01MB3776.ausprd01.prod.outlook.com
 ([fe80::861:b63c:843d:56c6%7]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 12:42:49 +0000
From: "zhangn1985@outlook.com" <zhangn1985@outlook.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: S905x (VIM) ramdon crashes, maybe due to display driver.
Thread-Topic: S905x (VIM) ramdon crashes, maybe due to display driver.
Thread-Index: AQHWmxIV9VG3nVaQekid8xf2L+tWvg==
Date: Mon, 5 Oct 2020 12:42:49 +0000
Message-ID: <SYCPR01MB37764A52D0614522A279AC76CD0C0@SYCPR01MB3776.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:90FB676BF1DA68E1D17BC01A4F03B832417680A0664688A241E575D790BC7BC0;
 UpperCasedChecksum:F5ABDDD4D310BBCAF84A1CF37A48592CA4780CC9F00FD9A5FA30B1791A0EA3F7;
 SizeAsReceived:6750; Count:42
x-tmn: [doy8o05Pu2fT3+nUpAaYLpnWTs68uDHd]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 950c094a-8220-4642-4aad-08d8692c2b37
x-ms-exchange-slblob-mailprops: S/btQ8cKWiSlXezRm4qQ0dWN9c22HAIWn0Pasxrhgyqen6NXC+S2im5KLAwmAbABgnvzeyhVyUFUx9QMlOTqFBBfO3LOmTaMGPp+JW8dQn10OGpkyv+nw4/dLmNRwz3KYz+voicEvxs8ZVn3S2t4iKm4eNBO5hj9RvYGlPRiiqbiCKGyLd9cqXePTrwfIdHtToYOqs4dLkq67XtHlzUwo35JvE7zeN7g7so3epP42G89nHvhya9hGATJhfeNvRMBMJdLJ69ZLz49DyqUTqqbl5AsmCx7b9Q0NT7H5QqvzHaeVrHLy1e0K0vrVd8UOiNnleC0MyU8wK3WmJ0qtQxmdhDqhFxPYsnQdJTDjaVgxOPTuUP+RDGFD7/NiCssEIoJx26rTjNZoJJxY8ZXigWpxhu6ERZs+z63YMwAbbmGBlHxxkYIfxNWatw3GV06XPDU4gY6Cjf2cse3kyyaQL19305JEMPSGBJGneJSKK6MAKDNIvqJZUDDGSqdDID2IVY2RWqpz3Ou2zLdm+hy+pnthOndhRv4O5NdHQylmdKAPhg59FjBJeGDdu6VuaSureJ5ZClwI2i9l+4ACLqR+4n0u6iqGj3Rq7volfkANlbFHAjO3rGTLKalVJcC0Kbn0h58fRFi1HSy30cvr558l78UL5Xh0/wvAVRgd7Q0nWjVc+sYGtcWTlRwG4HgrjOSz6zl734mxBem+SXCf2q1QIYloWptKs3AuqSst7RWhN5GP8Eyu6zt93jHTCxdwr3hzPoGg2JUIMf4ljs=
x-ms-traffictypediagnostic: PU1APC01HT183:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SEX3/foeLQj2JPFkadiaBKnpRHfS3boORKG8n52WlTiARRbjB83UGEVZEAzuGDLXkZkg/VzHrxAh51OZTw5RVNMTocD38S92gQg6abAxH2MEWw+fPvTlSI7g7MTnEl/jDknvx4a53pcUhxqRNCGWor9KqoL53gqdsO2HsTjw36MOefiBiJ9x3yO3Uh+GGgWj4Ho0kJ/Wa2+mOWQBt7ATgEw98usso35jK6Qr2Rrzy7OeT+KTXS6J8tZZLIDurMg5
x-ms-exchange-antispam-messagedata: x5tGJUtL2rxScUTJWeQ+DGBi4rRcrNk2O9fOsqOBW/rmKdCA6pFDjern1x2OQf1aR9y26in5++EHWci5GW0g7rrjUb4jtbW1trU0LEz9+xLrwnnO6/PMafKYMjN88Mh9oday4C6lE5bHzoBRc/w5xg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT007.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 950c094a-8220-4642-4aad-08d8692c2b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 12:42:49.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_084258_266701_4F58713F 
X-CRM114-Status: UNSURE (   7.44  )
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
Cc: "zhangn1985@outlook.com" <zhangn1985@outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi,

I observed VIM ramdon crashes from 5.7 kernel with WIP patches[1] from this=
 mail list. =


I have tried to find better power supply,=A0 remove case, =A0 install cooli=
ng fun, disable Xserver. VIM still ramdon crashes.

Thus I think this maybe VIM is broken, maybe due to thermal.

I don't have a chance to get the log, even no log print to console, when cr=
ash happens.

these days, I made it an arm64 build server, without connect a HDMI display=
. it runs very well, build kernel 3 days without any crash.

from the=A0phenomenon I think some hidden issues may in display driver.


[1]: https://github.com/zhangn1985/linux/commits/master/debian/patches/khad=
as

BR.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
