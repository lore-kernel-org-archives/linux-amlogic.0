Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2E7CDB483
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8MmDV3wZQk/lschJSPF/Fp6MuAlr8mG+upwC0/92Hk=; b=gJp8QO6f0s4ATE
	9D1RA7Bbo1GmdNq/zKT6BfK2961X3G7iT0/Ebpa3kT2OuOA9PVZG8r0BYXCWlBlVZte8tz6SZiLuN
	bXbA/s19aUADPnNZOc0wY2XXMWgofSTa0ebslrcvR54SgO2cYZ2U8XqdKeSLM/a6fwBGHYEvq46gG
	IfA7PI5hW7zLhV9onYxAsBYtjK1l7lezMflt4251T2rCkVpK8tbIq7RoTo1uw+68jQNJjuzqJ19Nv
	awg45XSYiCBbXmiVii+4vEc+xnr8nKISlm/kAqkg2AHvXaA4O4doV0JTel6DG/4PCLfcufjX3QS+x
	76hw4Iv7SgM8i4lDcrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrG2y-003HqX-2s;
	Fri, 13 Oct 2023 11:09:36 +0000
Received: from postfix2.imaqliq.com ([93.189.151.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrG2v-003HpX-2W;
	Fri, 13 Oct 2023 11:09:35 +0000
Received: from verse.imaqliq.com (verse.imaqliq.com [93.189.151.95])
	by postfix2.imaqliq.com (Postfix) with ESMTP id B8A001C2928;
	Fri, 13 Oct 2023 14:09:27 +0300 (MSK)
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <0120de74-0b86-469a-b19a-b4b98a60a080@kernel.org>
References: <0120de74-0b86-469a-b19a-b4b98a60a080@kernel.org>,
	<OF950BEF72.7F425944-ON00258A46.00488A76-00258A46.00497D44@gdc.ru>
Subject: Re: [PATCH v2] tty: serial: meson: hard LOCKUP on crtscts mode
From: Pavel Krasavin <pkrasavin@imaqliq.com>
To: "Jiri Slaby" <jirislaby@kernel.org>
Cc: Pavel Krasavin <pkrasavin@imaqliq.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Date: Fri, 13 Oct 2023 11:09:22 +0000
Message-ID: <OF9F10A7E1.E13FABB2-ON00258A47.003D2ECF-00258A47.003D485B@gdc.ru>
X-Mailer: Lotus Domino Web Server Release 12.0.2 November 03, 2022
X-MIMETrack: Serialize by http on verse/com(Release 12.0.2|November 03, 2022) at 10/13/2023
 11:09:22,
	Serialize complete at 10/13/2023 11:09:22,
	Serialize by Router on verse/com(Release 12.0.2|November 03, 2022) at 10/13/2023
 11:09:27
X-KeepSent: 9F10A7E1:E13FABB2-00258A47:003D2ECF;
 type=4; name=$KeepSent
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 180603 [Oct 13 2023]
X-KLMS-AntiSpam-Version: 6.0.0.2
X-KLMS-AntiSpam-Envelope-From: pkrasavin@imaqliq.com
X-KLMS-AntiSpam-Rate: 10
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dmarc=fail header.from=imaqliq.com policy=none;spf=softfail smtp.mailfrom=imaqliq.com;dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 539 539 807534d9021bfe9ca369c363d15ac993cd93d4d9, {rep_avail}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;gdc.ru:7.1.1;93.189.151.95:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;verse.imaqliq.com:7.1.1;imaqliq.com:7.1.1, FromAlignment: s, {Tracking_dmark_f}, ApMailHostAddress: 93.189.151.95
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2023/10/13 09:19:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2023/10/13 08:46:00 #22180318
X-KLMS-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_040933_990326_23237614 
X-CRM114-Status: UNSURE (   4.47  )
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

SGVsbG8gSmlyaSwKCi0tLS0tICJKaXJpIFNsYWJ5IiA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+INC/
0LjRgdCw0Lso0LApOiAtLS0tLQo+IFN1YmplY3Q6IHR0eTogc2VyaWFsOiBtZXNvbjogaGFyZCBM
T0NLVVAgb24gY3J0c2N0cyBtb2RlCgo+IEFoLCB5b3UgYXJlIGZpeGluZyBvbmU/IFNvIGhvdyBk
b2VzIHRoaXMgc291bmQ6Cj4gdHR5OiBzZXJpYWw6IG1lc29uOiBmaXggaGFyZCBMT0NLVVAgb24g
Y3J0c2N0cyBtb2RlCj4gPwoKeW91IGFyZSByaWdodCwgaWRlYSB3YXMgdG8gZml4IGl0LCBub3Qg
dG8gYWRkIDopCkkgYWdyZWUsIHlvdXIgc3ViamVjdCBsb29rcyBiZXR0ZXIhCgpTbywgZG8gSSBu
ZWVkIHRvIHByZXBhcmUgdjQgb2YgdGhpcyBwYXRjaCwgcmlnaHQ/CgotLQpSZWdhcmRzLApQYXZl
bC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
