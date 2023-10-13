Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10C1CDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDudxcTT8y1bam4fKyZzxho/sMRHP6gG5n6Ot9o2zwI=; b=gAntiy2T913KX5
	KRDHiXRj6KDvvRPEyzbKCEm7a+7WCg30qlgowsSJUDDX4ZdCcXvTlaldCQrcTRP7LHFM1q8hA+STG
	91Um9YU6uhEGaLwVSC8LhOa4II9eoj5OTJ70kNkUTFKWDfVPhCLpyuqJwAOpspV9qYNboWbHxFsC1
	S+cIdaYrU2M9hzYqnztWprTXDJoANrzYBCM3ocHcN0yX9CDTiGifv6ZwfTiYJJB7fGNVYRq5BjQ5D
	rCgT8dY8uiPojmp399er8HULVIMmzdHhFr5iR/UlrMWo8Qgflq7UpvaqMHTsrl6xcBbPQ4ZJXQ5p3
	oPKMmRclstSGXoIFe5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKuV-003q1T-12;
	Fri, 13 Oct 2023 16:21:11 +0000
Received: from postfix2.imaqliq.com ([93.189.151.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKuQ-003pwQ-2K;
	Fri, 13 Oct 2023 16:21:09 +0000
Received: from verse.imaqliq.com (verse.imaqliq.com [93.189.151.95])
	by postfix2.imaqliq.com (Postfix) with ESMTP id 783C61C2B9C;
	Fri, 13 Oct 2023 19:20:56 +0300 (MSK)
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <5765a10c-8f75-4bf4-830b-b5fba501d164@linaro.org>
References: <5765a10c-8f75-4bf4-830b-b5fba501d164@linaro.org>,
	<OF55521400.7512350F-ON00258A47.003F7254-00258A47.0040E15C@gdc.ru> <20231013141818.adq6eujrx2wueobp@CAB-WSD-L081021>
Subject: Re: [PATCH v4] tty: serial: meson: fix hard LOCKUP on crtscts mode
From: Pavel Krasavin <pkrasavin@imaqliq.com>
To: neil.armstrong@linaro.org
Cc: "Dmitry Rokosov" <ddrokosov@salutedevices.com>,
	Pavel Krasavin <pkrasavin@imaqliq.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jirislaby@kernel.org>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Date: Fri, 13 Oct 2023 16:20:50 +0000
Message-ID: <OFCBF5B209.BF3CBB33-ON00258A47.0059CADD-00258A47.0059CC5B@gdc.ru>
X-Mailer: Lotus Domino Web Server Release 12.0.2 November 03, 2022
X-MIMETrack: Serialize by http on verse/com(Release 12.0.2|November 03, 2022) at 10/13/2023
 16:20:50,
	Serialize complete at 10/13/2023 16:20:50,
	Serialize by Router on verse/com(Release 12.0.2|November 03, 2022) at 10/13/2023
 16:20:55
X-KeepSent: CBF5B209:BF3CBB33-00258A47:0059CADD;
 type=4; name=$KeepSent
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 180614 [Oct 13 2023]
X-KLMS-AntiSpam-Version: 6.0.0.2
X-KLMS-AntiSpam-Envelope-From: pkrasavin@imaqliq.com
X-KLMS-AntiSpam-Rate: 10
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dmarc=fail header.from=imaqliq.com policy=none;spf=softfail smtp.mailfrom=imaqliq.com;dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 539 539 807534d9021bfe9ca369c363d15ac993cd93d4d9, {rep_avail}, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, verse.imaqliq.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;gdc.ru:7.1.1;93.189.151.95:7.1.2;imaqliq.com:7.1.1, FromAlignment: s, {Tracking_dmark_f}, ApMailHostAddress: 93.189.151.95
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2023/10/13 15:28:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2023/10/13 14:32:00 #22183459
X-KLMS-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_092106_952849_D9B29F64 
X-CRM114-Status: UNSURE (   8.58  )
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

RG1pdHJ5LCBOZWlsLAoKLS0tLS0gIk5laWwgQXJtc3Ryb25nIiA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4g0L/QuNGB0LDQuyjQsCk6IC0tLS0tCj4+IE9uIDEzLzEwLzIwMjMgMTY6MTgsIERt
aXRyeSBSb2tvc292IHdyb3RlOgo+PiBJIGJlbGlldmUgaXQgd291bGQgYmUgbmVjZXNzYXJ5IHRv
IGluY2x1ZGUgYSAnRml4ZXMnIHRhZyBmb3IgdGhhdC4gTmVpbCwKPj4gd2hhdCBkbyB5b3UgdGhp
bms/Cj4+IFNpbmNlIGEgSEFSRExPQ0tVUCBpcyBhbiB1bmRlc2lyYWJsZSBzaXR1YXRpb24sIEkg
ZG9uJ3QgdGhpbmsgd2Ugd2FudCB0bwo+PiBoYXZlIGl0IGluIHRoZSBMVFMga2VybmVscyBlaXRo
ZXIuCgo+IFllcywgYW5kIHBsZWFzZSBrZWVwIHRoZSBwcmV2aW91cyBSZXZpZXdlZC1ieSBEbWl0
cnkgYW5kIEkgYWRkZWQgb24gdjMgYW5kIHNlbmQgYSB2NSB3aXRoIHRoZSBGaXhlcyBhZGRlZC4K
U29ycnkgZm9yIHRoaXMuCgo+IEl0IHNob3VsZCBiZToKPiBGaXhlczogZmY3NjkzZDA3OWU1ICgi
QVJNOiBtZXNvbjogc2VyaWFsOiBhZGQgTWVzb25YIFNvQyBvbi1jaGlwIHVhcnQgZHJpdmVyIikK
R290IGl0LgoKPiBIb3BlZnVsbHkgaXQgd2lsbCBiZSB0aGUgbGFzdCBpdGVyYXRpb24uCkknbGwg
ZG8gbXkgYmVzdC4gVGhhbmsgeW91IGZvciB5b3VyIHdvcmsgb24gdGhpcyBwYXRjaC4KClJlZ2Fy
ZHMsClBhdmVsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
