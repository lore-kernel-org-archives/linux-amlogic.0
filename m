Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C27AC4727F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:47:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E92DC20B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ObGeatp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E92DC20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fWH8ZWHqTGeRP1Q/aXVJxtcZL/53VpqB4n2OZc582lM=; b=1ObGeatp9ycdQfOMuXZAsB1tTW
	lXH5fgKOjWM/FHPfMSd+V0kGq9AFwTB7amjqFop0tjZY5HO1pnc1h/zuMsZ1DVIwpaH0JWXmV5fDN
	96ftdF5piTNRXoqADLnARI0AlYZhFhaqWMPhudN7tnR9vetZvzMwkW6p4jpJVNvRhQGsMQ6N7L7QS
	ZoTr87lRi/+Q0zQNRbkOYAjik2On24qg9bEmGGTQRKEU4XcOmHX4vYDqsEBYS45I5WnMsuxhyVwHW
	gd5voRnujAb8Hb64fF2HgJSnQqUSpvelMQZrO4Aw2WK0L5xEkUb0DgKAHgRV3DiVNr0cbR+3sDmKx
	uVTQO/SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlof-0000Im-OR; Wed, 30 Sep 2020 23:47:21 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNloc-0000I8-G4; Wed, 30 Sep 2020 23:47:19 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTiLj-1jyIQs3sRZ-00U2pM; Thu, 01 Oct 2020 01:47:04 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNloJ-0007Ye-6b; Thu, 01 Oct 2020 01:47:00 +0200
Received: (nullmailer pid 7671 invoked by uid 2001);
 Wed, 30 Sep 2020 23:46:58 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 0/7] leds: pwm: Make automatic labels work
Date: Thu,  1 Oct 2020 01:46:30 +0200
Message-Id: <20200930234637.7573-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: a725df07d7ef17d6c9c3b8b0b262d2c4
X-Provags-ID: V03:K1:1elWBi7e5x3yI9alpARH+EzCpdRWKPCu5CRyf0GlHEX72/7ReQG
 uK+KfSK9bq2XSjeizOMOQ1aX81WAtDM6x33xXmSQR4PGyxTAFe+Gyet5tvr5SsoocF8fkI6
 wSoVyqgv448pDp8oa8pMgpO1/2adBnPHdkc6W+5jqszUFcPSeKSiuI0MNhA2Cm5ImFDpZJd
 CTEWaoq7Zs45webTwlzJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6alNuLrEGTM=:/JzZgqFL5jcymyQztVcQOq
 FjxmZcvrBOVCPqcnXy+7LRNn5FCV5x5rFniePHKClSKDklFA4XytiJHTWPmRH9scMeoS+B/64
 BlVgHSGulgI65FjtqdOjhileRqNHQIAzBZFbiqQpFNgq202+GikFCy/xaHpOVEh9vg1IajYCg
 Lt2eTnDEB6DJGd0SFFM842tbVSWrI+WNSL360BFHDKFAPPPAVI9v3d8UpyaPR7KXcb1uVYWCt
 Hau+i8KYufRR7C1yX5kkvYa5LTp0YaMb0Ve1AGNoUzRBQwJVhGlY4V3tEcZInhhVHbhgkuL6O
 fOsv227odzxhpVjJUpU/bA4Km556V1smNzzjItRCNc5HuK1IRc2nqpm8rIQC5nekctRbVWoLV
 3PiWxpx65aIICaHcYPUejEw4aeNO8l2jyzzDzJYsyZ/YYWQ+WhfvfwS6y2CfQk6ZkhJX14JcV
 /PU/XTVQaV931qWbzKdRfR/o4zTOlmBUq7NncVRTHyfAHo7CTLWk/W9RFVVl5jSMjvUgGtAt2
 SRsXkr11xKUT3BEHgNRDwtgfcIzkT1/5lykDr7NRvqX6jQEG82cb2ItZrccHXrWAIUOs8wzHL
 tBNrUqdkqhI4bqoGzIMThGTJB4Q119crVleU9q0AjRzrjwmc8sa6vWnjRXjl4SZLuMSXEaVb7
 BjoIGbdsc8iPEdoPHiSb5o/b+FnAMlKVCgRiiu8Tgr6mU24AjEduYafCSw19DqMnNp6sVjeN1
 QoSC10dCkrDX1VvK7iCze3yiqtIGW+Dyi+QDP7oAR3Dnnubg6HFlDL7Qjm4X5VOwlEL/W9uVb
 srj/mjCZd9wH4qLjLDzrwxLf52R1XcL+nIJENySPlOGCa5beS/UYs1Xpa/UA7Hff+6YMO6W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194718_763391_A4782EBF 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVpIGhlaSwKCmZvciBsZWRzLWdwaW8geW91IGNhbiB1c2UgdGhlIHByb3BlcnRpZXMgJ2Z1bmN0
aW9uJyBhbmQgJ2NvbG9yJyBpbiB0aGUKZGV2aWNldHJlZSBub2RlIGFuZCBvbWl0ICdsYWJlbCcs
IHRoZSBsYWJlbCBpcyBjb25zdHJ1Y3RlZAphdXRvbWF0aWNhbGx5LiAgVGhpcyBpcyBhIGNvbW1v
biBmZWF0dXJlIHN1cHBvc2VkIHRvIGJlIHdvcmtpbmcgZm9yIGFsbApMRUQgZHJpdmVycy4gIEhv
d2V2ZXIgaXQgZGlkIG5vdCB5ZXQgd29yayBmb3IgdGhlICdsZWRzLXB3bScgZHJpdmVyLgoKVGhp
cyBzZXJpZXMgcmVtb3ZlcyBwbGF0Zm9ybV9kYXRhIHN1cHBvcnQgZm9yIHRoZSBsZWRzLXB3bSBk
cml2ZXIgYW5kCnRha2VzIHRoZSBvcHBvcnR1bml0eSB0byB1cGRhdGUgdGhlIGxlZHMtcHdtIGR0
LWJpbmRpbmdzIGFjY29yZGluZ2x5LgoKQWZ0ZXIgbXlzZWxmIGJlaW5nIG9uZSB3ZWVrIG9uIHZh
Y2F0aW9uIHBhdGNoIDIvMyB3YXMgYWxyZWFkeSBwaWNrZWQgYnkKUGF2ZWwgYW5kIEkgZ2F0aGVy
ZWQgc29tZSBtb3JlIGZlZWRiYWNrIG9uIHRoZSByZW1haW5pbmcgaXNzdWVzLgoKdjYgd2FzIGNv
bXBpbGUgdGVzdGVkIGFuZCBkdF9iaW5kaW5nc19jaGVjayBhbmQgZHRic19jaGVjayB3ZXJlIHJ1
bi4KCk5vdGU6IEkgYWRkZWQgc29tZSBwYXRjaGVzIHRvIGZpeCBEVCBzY2hlbWEgd2FybmluZ3Ms
IGJ1dCBJIGRpZCBub3QgcHV0CmV2ZXJ5IHJldmlld2VyL3N1cHBvcnRlci9tYWludGFpbmVyIHBy
aW50ZWQgYnkgZ2V0X21haW50YWluZXJzIGluIENjIHRvCmtlZXAgdGhhdCBsaXN0IHJlYXNvbmFi
bGUgc21hbGwuCgpTZXJpZXMgY2hhbmdlbG9nIGJlbG93IOKApgoKR3JlZXRzCkFsZXgKCnY2Ogot
IHJlYmFzZWQgc2VyaWVzIG9uIHJlY2VudCBwYXZlbC9mb3ItbmV4dAotIGFkZGVkIFJldmlld2Vk
LWJ5IGZyb20gTWFyZWsgdG8gcGF0Y2ggMQotIHBhdGNoIDIgZnJvbSB2NSB3YXMgcGlja2VkIGJ5
IFBhdmVsIGFuZCBpcyBhbHJlYWR5IGluIGhpcyBmb3ItbmV4dAogIGJyYW5jaAotIHByZXZpb3Vz
IHBhdGNoIDMvMyAobm93IDIvNykgd2FzIHJld29ya2VkIGJhc2VkIG9uIGZlZWRiYWNrIGJ5IFJv
YgotIGFkZGVkIG1vcmUgZHQgcGF0Y2hlcyBmaXhpbmcgd2FybmluZ3MgYWZ0ZXIgYmluZGluZyBj
b252ZXJzaW9uIHRvIHlhbWwKCnY1OgotIHJlcGxhY2VkIHBhdGNoIDEvMyBieSBhIG5ldyBwYXRj
aCByZW1vdmluZyBwbGF0Zm9ybV9kYXRhIHN1cHBvcnQgZm9yCiAgdGhlIGxlZHMtcHdtIGRyaXZl
cgotIGxpdHRsZSByZXdvcmRpbmcgb2YgY29tbWl0IG1lc3NhZ2UgaW4gcGF0Y2ggMi8zCi0gdXBk
YXRlZCBwYXRjaCAzLzMgYmFzZWQgb24gZmVlZGJhY2sgYnkgUm9iIEhlcnJpbmcKLSBhZGRlZCBN
YXJlayBCZWjDum4gdG8gQ2MsIGJlY2F1c2UgaGUgYWxzbyB3b3JrcyBvbiByZW1vdmluZwogIHBs
YXRmb3JtX2RhdGEgc3VwcG9ydAotIHJlYmFzZWQgc2VyaWVzIG9uIHBhdmVsL2Zvci1uZXh0Cgp2
NDoKLSBhZGRlZCBsZWQtY2xhc3MgcGF0Y2ggaGFuZGxpbmcgZndub2RlIHBhc3NpbmcgZGlmZmVy
ZW50bHkgKHBhdGNoIDEvMykKLSBhZGFwdGVkIGxlZHMtcHdtIHBhdGNoIHRvIG5ldyBsZWQtY2xh
c3MgKHBhdGNoIDIvMykKLSBjb250YWN0ZWQgb3JpZ2luYWwgYXV0aG9yIG9mIGxlZHMtcHdtIGR0
IGJpbmRpbmcgb24gbGljZW5zZSBpc3N1ZQogIChwYXRjaCAzLzMpCgp2MzoKLSBzZXJpZXMgcmVi
YXNlZCBvbiB2NS45LXJjNAotIGNoYW5nZWQgbGljZW5zZSBvZiAueWFtbCBmaWxlIHRvIHJlY29t
bWVuZGVkIG9uZSAocGF0Y2ggMi8yKQotIGFkZGVkIEFja2VkLWJ5IHRvIGJvdGggcGF0Y2hlcwoK
djI6Ci0gc2VyaWVzIHJlYmFzZWQgb24gdjUuOS1yYzMKLSBhZGRlZCB0aGUgZHQtYmluZGluZ3Mg
dXBkYXRlIHBhdGNoICgyLzIpCgp2MToKLSBiYXNlZCBvbiB2NS45LXJjMgotIGJhY2twb3J0IG9u
IHY1LjQuNTkgdGVzdGVkIGFuZCB3b3JraW5nCgpBbGV4YW5kZXIgRGFobCAoNyk6CiAgbGVkczog
cHdtOiBSZW1vdmUgcGxhdGZvcm1fZGF0YSBzdXBwb3J0CiAgZHQtYmluZGluZ3M6IGxlZHM6IENv
bnZlcnQgcHdtIHRvIHlhbWwKICBkdC1iaW5kaW5nczogbWZkOiBGaXggc2NoZW1hIHdhcm5pbmdz
IGZvciBwd20tbGVkcwogIEFSTTogZHRzOiBhdDkxOiBzbWFydGtpejogUmVmZXJlbmNlIGxlZCBu
b2RlIGRpcmVjdGx5CiAgQVJNOiBkdHM6IEZpeCBzY2hlbWEgd2FybmluZ3MgZm9yIHB3bS1sZWRz
CiAgYXJtNjQ6IGR0czogbWVzb246IEZpeCBzY2hlbWEgd2FybmluZ3MgZm9yIHB3bS1sZWRzCiAg
TUlQUzogRFRTOiBpbWc6IEZpeCBzY2hlbWEgd2FybmluZ3MgZm9yIHB3bS1sZWRzCgogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3bS50eHQgICAgIHwgNTAgLS0tLS0tLS0tLS0t
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3bS55YW1sICAgIHwgNzAgKysr
KysrKysrKysrKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1s
ICAgICAgIHwgIDUgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEta2l6Ym94LmR0cyAgICAgICAg
ICAgICB8IDEwICstLQogYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1raXpib3gyLWNvbW1vbi5kdHNp
ICAgIHwgIDggKy0tCiBhcmNoL2FybS9ib290L2R0cy9hdDkxLWtpemJveDMtaHMuZHRzICAgICAg
ICAgfCAxNiArKy0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1raXpib3gzX2NvbW1vbi5kdHNp
ICAgIHwgMTAgKy0tCiBhcmNoL2FybS9ib290L2R0cy9hdDkxLWtpemJveG1pbmktY29tbW9uLmR0
c2kgfCAgOCArLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc21hcnRraXouZHRzICAgICAgICAg
ICB8ICA2ICstCiBhcmNoL2FybS9ib290L2R0cy9hdDkxc2FtOW0xMGc0NWVrLmR0cyAgICAgICAg
fCAxMCArLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTFzYW05cmxlay5kdHMgICAgICAgICAgICB8
IDEwICstLQogLi4uL2Jvb3QvZHRzL2JlcmxpbjJjZC1nb29nbGUtY2hyb21lY2FzdC5kdHMgIHwg
IDYgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkaGMxLmR0cyAgICB8ICA0
ICstCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9pZHh1NC5kdHMgICAgfCAgNCAr
LQogLi4uL2Jvb3QvZHRzL2V4eW5vczU0eHgtb2Ryb2lkeHUtbGVkcy5kdHNpICAgIHwgMTEgKy0t
CiBhcmNoL2FybS9ib290L2R0cy9pbXg1My1wcGQuZHRzICAgICAgICAgICAgICAgfCAxNSArKy0t
CiBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWN1Ym94LWkuZHRzaSAgICAgICAgfCAgNCArLQog
Li4uL2Jvb3QvZHRzL2lteDZzeC1zb2Z0aW5nLXZpbmluZy0yMDAwLmR0cyAgIHwgIDggKy0tCiBh
cmNoL2FybS9ib290L2R0cy9vbWFwMy1iZWFnbGUteG0uZHRzICAgICAgICAgfCAxMCArLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL29tYXAzLW92ZXJvLWJhc2UuZHRzaSAgICAgICB8ICA0ICstCiBhcmNo
L2FybS9ib290L2R0cy9vbWFwNC1rYzEuZHRzICAgICAgICAgICAgICAgfCAgNiArLQogYXJjaC9h
cm0vYm9vdC9kdHMvb21hcDQtc2RwLmR0cyAgICAgICAgICAgICAgIHwgMjYgKysrLS0tLQogYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtbHhhLW1jMS5kdHMgICAgIHwgMTIgKystLQogLi4u
L2FtbG9naWMvbWVzb24tZ3hsLXM5MDV4LWtoYWRhcy12aW0uZHRzICAgIHwgIDQgKy0KIC4uLi9k
dHMvYW1sb2dpYy9tZXNvbi1neG0ta2hhZGFzLXZpbTIuZHRzICAgICB8ICA0ICstCiAuLi4vYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtc2VpNjEwLmR0cyAgICAgfCAgOCArLS0KIGFyY2gvbWlw
cy9ib290L2R0cy9pbWcvcGlzdGFjaGlvX21hcmR1ay5kdHMgICB8ICA1ICstCiBkcml2ZXJzL2xl
ZHMvbGVkcy1wd20uYyAgICAgICAgICAgICAgICAgICAgICAgfCAzMCArKy0tLS0tLQogMjggZmls
ZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDE4MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3
bS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9sZWRzLXB3bS55YW1sCgoKYmFzZS1jb21taXQ6IDhmZDhmOTQyMzVjMmM5MjVkODBi
MjMxNmUwYWIyYmRkMDBhZjliYWUKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
