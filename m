Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5818C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jan 2022 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0z2lXkQ8ik53FJjtJxPEGArWAlMegrkf6n5V8/ysjQE=; b=jGiAJwrr4Za+/j
	6yvhK5MPyJDlMOiiqv3KaDPVxyYYaxuoDwhL2RYr/oUZ8FncvWRxnjUAkI9mvcRluNDvtTF7gaCAb
	0vkt3nAF2I3j0g2vHcw4qaAcesbNQctVWjUPBJCfXCBeGi3M25DLGqUoaddeJAlN3rmlJMkkMsQ7r
	DnaAHg8AhjQrVEE3V8u/3gHpUQzWr+vEZ2K2aG1hO23Xh9SilngKghTblwZY9D5Qafg8EgXkjYxLP
	K5JMtZaNRRnJFPMzZpVw0FVW4h/FwTZTPTaBbD+yYqo2ftoyd2AyQO7ohxjngHOc3Vjur/FW0IoBi
	+AUG+B3eVEwZD5E0Q7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDWyk-003QHj-DS; Fri, 28 Jan 2022 19:32:14 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDWyY-003QEJ-Er; Fri, 28 Jan 2022 19:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643398318;
 s=strato-dkim-0002; d=ko-hh.de;
 h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=5YlNcTtCJN5n71TbHMcDEInsEHXP0BHMHEC9kJEYAL0=;
 b=RNeiht6tPzmjXga6Dpf/Wv58kWRF/AW13caAhmU6RLT64A5TUYC+PKfnQB4EK6gvJ4
 SXKI3eMNMzeKQP9hvKV2C9YOULI522sq7ZYQ0gaswjpEP9/PI6/1WnG0wT9Bqt+LeVsV
 E9Hw7JZzcL2hd4XlZvQKo6gdZLLJXTDU10fgbYwFX3kkfeEWkBs7/Rfs6lLmsrQf6FbY
 gThDqfp/3Geyl4rOfT+HG08vNWk2GYKh86iHC3ynScqwmhkNZUAxIwV8yq8332Y3F8sx
 4I3VZJNhVfR8xnpZYTQ5hH90TPwnN7SsejLEMvrfPVowQarSTBU366nspbC89w2mWRSf
 c8gQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGQBeUWjaN+znm36YqWmJEx4lU5vgP4am+jDJsl40KLIzDO7mhvQTIqgxZ0NBW/c2w=="
X-RZG-CLASS-ID: mo00
Received: from odroid-VirtualBox by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
 with ESMTPSA id L5f488y0SJVvxCb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Jan 2022 20:31:57 +0100 (CET)
Date: Fri, 28 Jan 2022 20:31:50 +0100
From: Lutz Koschorreck <theleks@ko-hh.de>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1-odroid: fix boot loop after reboot
Message-ID: <20220128193150.GA1304381@odroid-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_113202_731686_1AB25A81 
X-CRM114-Status: UNSURE (   9.95  )
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

U2luY2UgdGhlIGNvcnJlY3QgZ3BpbyBwaW4gaXMgdXNlZCBmb3IgZW5hYmxpbmcgdGYtaW8gcmVn
dWxhdG9yIHRoZQpzeXN0ZW0gZGlkIG5vdCBib290IGNvcnJlY3RseSBhZnRlciBjYWxsaW5nIHJl
Ym9vdC4KClsgICAzNi44NjI0NDNdIHJlYm9vdDogUmVzdGFydGluZyBzeXN0ZW0KYmwzMSByZWJv
b3QgcmVhc29uOiAweGQKYmwzMSByZWJvb3QgcmVhc29uOiAweDAKc3lzdGVtIGNtZCAgMS4KU00x
OkJMOjUxMWY2Yjo4MWNhMmY7RkVBVDpBMEY4MzE4MDoyMDI4MjAwMDtQT0M6QjtSQ1k6MDtTUElO
T1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtTRDowO1JFQUQ6MDswLjA7Q0hLOjA7
CmJsMl9zdGFnZV9pbml0IDB4MDEKYmwyX3N0YWdlX2luaXQgMHg4MQpodyBpZDrilpJTTTE6Qkw6
NTExZjZiOjgxY2EyZjtGRUFUOkEwRjgzMTgwOjIwMjgyMDAwO1BPQzpCO1JDWTowO1NQSU5PUjow
O0NISzoxRjtFTU1DOjgwMDtOQU5EOjgxO1NEPzowO1NEOjQwMDtVU0I6ODtMT09QOjE7U1BJTk9S
OjA7Q0hLOjFGO0VNTUM6ODAwO05BTkQ6ODE7U0Q/OjA7U0Q6NDAwO1VTQjo4O0xPT1A6MjtTUElO
T1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtTRDo0MDA7VVNCOjg7TE9PUDozO1NQ
SU5PUjowO0NISzoxRjtFTU1DOjgwMDtOQU5EOjgxO1NEPzowO1NEOjQwMDtVU0I6ODtMT09QOjQ7
U1BJTk9SOjA7Q0hLOjFGO0VNTUM6ODAwO05BTkQ6ODE7U0Q/OjA7U0Q6NDAwO1VTQjo4O0xPT1A6
NTtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtTRDo0MDA7VVNCOjg7CgpT
ZXR0aW5nIHRoZSBncGlvIHRvIG9wZW4gZHJhaW4gc29sdmVzIHRoZSBpc3N1ZS4KClNpZ25lZC1v
ZmYtYnk6IEx1dHogS29zY2hvcnJlY2sgPHRoZWxla3NAa28taGguZGU+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQuZHRzaSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtb2Ryb2lkLmR0c2kgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC5kdHNpCmluZGV4IGVkN2NkNWY1MzA0
Ni4uZGRiMWIzNDUzOTdmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tc20xLW9kcm9pZC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1zbTEtb2Ryb2lkLmR0c2kKQEAgLTQ4LDcgKzQ4LDcgQEAgdGZfaW86IGdwaW8tcmVndWxh
dG9yLXRmX2lvIHsKIAkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CiAJCXZp
bi1zdXBwbHkgPSA8JnZjY181dj47CiAKLQkJZW5hYmxlLWdwaW8gPSA8JmdwaW9fYW8gR1BJT0Vf
MiBHUElPX0FDVElWRV9ISUdIPjsKKwkJZW5hYmxlLWdwaW8gPSA8JmdwaW9fYW8gR1BJT0VfMiBH
UElPX09QRU5fRFJBSU4+OwogCQllbmFibGUtYWN0aXZlLWhpZ2g7CiAJCXJlZ3VsYXRvci1hbHdh
eXMtb247CiAKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
