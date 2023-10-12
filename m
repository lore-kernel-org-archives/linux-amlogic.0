Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E58ACDB46E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 12:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aVYQbr3Khzn7tlUh5ajNbaa2pCQGNCMOI/ltUAaqxI=; b=p49qGDT5n9l0XU
	f/hZizR6+xY+e+rxLF9l0wHYfnayLh3ZPfXRjVMOtQTPUWHgIzqx0WfmrBt/nhdFd9oj1eDSE8McL
	eCo/9/mLNz6THCuVdroOOIPL9uONvV3JRZKktk+JzJTYimr3g7DJQg8JBuoawfUsOXh3fSdiCjCNu
	chpqUuPUFFm/1pEVpsc7XBRtA05y+QrtXXXGspWtiWvTQ0yYN6TnFP/iZB+VB69rXdfn4gDxL/CnT
	Q3ZfNa45cqTxJqnIaazP6Oail0YCNMzBv9Z732tPyDqNFCRT83HfQRhgKHY6dmYUZTGHjFosFIHEC
	qpIswuNTiLBsp9BaL7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquv2-000z12-0q;
	Thu, 12 Oct 2023 12:36:00 +0000
Received: from postfix2.imaqliq.com ([93.189.151.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquuw-000yxe-1Q;
	Thu, 12 Oct 2023 12:35:59 +0000
Received: from verse.imaqliq.com (verse.imaqliq.com [93.189.151.95])
	by postfix2.imaqliq.com (Postfix) with ESMTP id E78D01C2943;
	Thu, 12 Oct 2023 15:35:50 +0300 (MSK)
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <20231012103957.p2faputywfgh776x@CAB-WSD-L081021>
References: <20231012103957.p2faputywfgh776x@CAB-WSD-L081021>,
	<OF28B2B8C9.5BC0CD28-ON00258A46.0037688F-00258A46.0039155B@gdc.ru>
Subject: Re: [PATCH] tty: serial: meson: hard LOCKUP on crtscts mode
From: pkrasavin@imaqliq.ru
To: "Dmitry Rokosov" <ddrokosov@salutedevices.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
	<linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<kernel@sberdevices.ru>,
	<linux-amlogic@lists.infradead.org>
Date: Thu, 12 Oct 2023 12:35:45 +0000
Message-ID: <OF69FF15CB.37BD077D-ON00258A46.0044809B-00258A46.004530FF@gdc.ru>
X-Mailer: Lotus Domino Web Server Release 12.0.2 November 03, 2022
X-MIMETrack: Serialize by http on verse/com(Release 12.0.2|November 03, 2022) at 10/12/2023
 12:35:45,
	Serialize complete at 10/12/2023 12:35:45,
	Serialize by Router on verse/com(Release 12.0.2|November 03, 2022) at 10/12/2023
 12:35:50
X-KeepSent: 69FF15CB:37BD077D-00258A46:0044809B;
 type=4; name=$KeepSent
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 180564 [Oct 12 2023]
X-KLMS-AntiSpam-Version: 6.0.0.2
X-KLMS-AntiSpam-Envelope-From: pkrasavin@imaqliq.ru
X-KLMS-AntiSpam-Rate: 10
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dmarc=fail header.from=imaqliq.ru policy=none;spf=softfail smtp.mailfrom=imaqliq.ru;dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 539 539 807534d9021bfe9ca369c363d15ac993cd93d4d9, {rep_avail}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;gdc.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;verse.imaqliq.com:7.1.1;imaqliq.ru:7.1.1;93.189.151.95:7.1.2, FromAlignment: s, {Tracking_dmark_f}, ApMailHostAddress: 93.189.151.95
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2023/10/12 11:06:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2023/10/12 09:47:00 #22170412
X-KLMS-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_053554_674965_E10FA744 
X-CRM114-Status: UNSURE (   5.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gRG1pdHJ5LAoKLS0tLS0gIkRtaXRyeSBSb2tvc292IiA8ZGRyb2tvc292QHNhbHV0ZWRl
dmljZXMuY29tPiDQv9C40YHQsNC7KNCwKTogLS0tLS0KCj4gUGxlYXNlIGRvIG5vdCB1c2UgYnJh
Y2VzIHdoZXJlIGlzIHNpbmdsZSBzdGF0ZW1lbnQuIEluIG90aGVyIHdvcmRzOgo+IAo+IAlpZiAo
Y2ZsYWdzICYgQ1JUU0NUUykgewo+IAkJaWYgKHBvcnQtPmZsYWdzICYgVVBGX0hBUkRfRkxPVykK
PiAJCQl2YWwgJj0gfkFNTF9VQVJUX1RXT19XSVJFX0VOOwo+IAkJZWxzZQo+IAkJCXRlcm1pb3Mt
PmNfY2ZsYWcgJj0gfkNSVFNDVFM7Cj4gCX0gZWxzZSB7Cj4gCQl2YWwgfD0gQU1MX1VBUlRfVFdP
X1dJUkVfRU47Cj4gCX0KCgp0aGFuayB5b3UgZm9yIHlvdXIgbm90ZSwgSSB3aWxsIHByb3ZpZGUg
djIgd2l0aG91dCBicmFjZXMuCgotLQpSZWdhcmRzLApQYXZlbC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
