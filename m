Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8138C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:14:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A8F22D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A8F22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hTvxXWuTBORi11Zp/x2bTLBlMOwAhSwYjM+jOsM3ZnA=; b=dtHQij8+y3ij9oDks9ySS05au
	qWzdV4eRKWM9KdOcK5Px44rUTvY/nEKPXmmdpKFN61bsJePi9sGZd5kVI51BuP75CxS4gIaitk48L
	FT1Coi9FHDEuP9y2ZyxUd86GyEemSCpEm6UTu+/oZ9+uihiyGXVa4T15rFBNGAFbyffjFc+CXncZW
	/tMBJ2sFMavlzpiOYhkUjbVpAzxrNcNG2RJSLtX+vMkoqjBEXndA7AgehCwR+W4x1deaK/bhJPDQB
	DSzi8jBtT7FwhTsDGLBEYlsPwJEyIpCoxW6GTGwVFUd1zI35/DJG9hJUrhytgztVc+6jtmQgkIaTH
	1wcz2EmwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPh6-0001z2-SK; Mon, 21 Dec 2020 18:14:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgl-0001sE-4h; Mon, 21 Dec 2020 18:13:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 3so11822894wmg.4;
 Mon, 21 Dec 2020 10:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=htWpp3iKagAp/qem+WLHc63LEn5Nif+eGu8hyXoZAoY=;
 b=MOnQAKHEImD9X64/gcEyDfGlMI84eE0HnR8ZqMOb8Zp39e38nDGCaaj32uQumTrqjX
 iuMJSVwSHRPDweKbfjcmnwAcVdYxY9q4seeWG5F/91coHSMpXGN7c/CTNAoLe2ZYjR03
 Pi8BPVqqqtHRsI2p2KeEjyFoY7SXOWMrINXyoZq/djUxtjBalzh8lMVhs/5V4zf7FPxB
 jsZbUtG3WVrAPGJ828je10I4L74XOuvB64tmffslqgNxiF2SR+jKXr/p9RsuMwbefB9q
 i1LuX3/49qv0M5SPNItpIVnOoAjhH+93RpUklJggFhCIep0BuHJYsitFUSldmkgOgl4H
 6pCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=htWpp3iKagAp/qem+WLHc63LEn5Nif+eGu8hyXoZAoY=;
 b=GbtnHQpub/tinssGDCMruVJDtBonvk5VjJu3YVll6NB+eJ8BUMIZwERMgIXOhwjS3Q
 tGvtJDvfa92Htu2biSs450tC564AcQD7yKWzf8i22BZDkYOF+CrdBbtbqAOxN8/AxnED
 Vra7GmRzqDWp2F9G0XvP0oCAoa8fKM8Eqp+oi/YkuSk3sBfyarworPa5eno82pquexy4
 oHYbdAku3xZuwnQCsREVeRTRVJwQw/6Mdw3sZJDRphZ/v81YeposI9TbqZMyEMWKYEXW
 SSBouQJFtYrvDZJX/TQZg2Vdzom6hExrTJ09TKZ0lAwxCNn/auuGzzrVD3UnXlR/qddb
 CHxw==
X-Gm-Message-State: AOAM532sKCKioTF5sHTKVl5Sme52flKiijxvEweuNfdO4HBUH+OPxB+t
 3EnNW8cZSf5rKTYxpv7STGRQo22fFi4=
X-Google-Smtp-Source: ABdhPJwPVeC/S2fOq4AHcgYMmdO6siU97r4ZLGePCER4Vy3o/0t1Sshm+A23OGyh+e1krTVohsuGLA==
X-Received: by 2002:a1c:8085:: with SMTP id b127mr17547256wmd.16.1608574421478; 
 Mon, 21 Dec 2020 10:13:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 4/5] ARM: dts: meson8b: add the thermal-zones with cooling
 configuration
Date: Mon, 21 Dec 2020 19:13:05 +0100
Message-Id: <20201221181306.904272-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131343_268515_CF1B4F37 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIHZlbmRvciBrZXJuZWwgdXNlcyB0aGUgZm9sbG93aW5nIHRoZXJtYWwtem9uZSBzZXR0aW5n
czoKPD0gNzDCsEM6Ci0gQ1BVIGZyZXF1ZW5jeSBsaW1pdGVkIHRvIDEuNDg4R0h6Ci0gR1BVIGxp
bWl0ZWQgdG8gNTExTUh6IGFuZCAyIGNvcmVzIChwaXhlbCBwcm9jZXNzb3JzKQoKPD0gODDCsEM6
Ci0gQ1BVIGZyZXF1ZW5jeSBsaW1pdGVkIHRvIDEuMkdIegotIEdQVSBsaW1pdGVkIHRvIDQzNU1I
eiBhbmQgMiBjb3JlcyAocGl4ZWwgcHJvY2Vzc29ycykKCjw9IDkwwrBDOgotIENQVSBmcmVxdWVu
Y3kgbGltaXRlZCB0byAwLjgwNEdIegotIEdQVSBsaW1pdGVkIHRvIDMyOE1IeiBhbmQgMSBjb3Jl
IChwaXhlbCBwcm9jZXNzb3IpCgpBZGQgc2ltcGxpZmllZCB0aGVybWFsIGNvbmZpZ3VyYXRpb24g
d2hpY2ggaXMgdGFrZW4gZnJvbSB0aGUKR1hCQi9HWEwvR1hNIFNvQyBmYW1pbHkgKHdoaWNoIHVz
ZXMgdGhlIHNhbWUgbWFudWZhY3R1cmluZyBwcm9jZXNzIGFuZApoYXMgdGhlIHNhbWUgbWF4aW11
bSBqdW5jdGlvbiB0ZW1wZXJhdHVyZSBvZiAxMjXCsEMpLiBXaXRoIHRoaXMgdGhlCnRoZXJtYWwg
ZnJhbWV3b3JrIHdpbGwgdHJ5IHRvIGtlZXAgdGhlIFNvQyB0ZW1wZXJhdHVyZSBhdCBvciBiZWxv
dyA4MMKwQwp3aGljaCBpcyBpZGVudGljYWwgdG8gdGhlIHZlbmRvciBrZXJuZWwgKHdpdGggdGhl
IGV4Y2VwdGlvbiBvZiBvbmUgQ1BVCmZyZXF1ZW5jeSBzdGVwIGZyb20gMS40ODhHSHogdG8gMS41
MzZHSHopLgoKVGhlIG51bWJlciBvZiBHUFUgY29yZXMgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291
bnQgYXMgdGhpcyBpcyBub3QKc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1ieTogTWFydGluIEJsdW1l
bnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9tZXNvbjhiLmR0c2kgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIu
ZHRzaQppbmRleCAyNDAxY2RmNWY3NTEuLmRiZjc5NjNiNmM4NyAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvbWVzb244Yi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIu
ZHRzaQpAQCAtMTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL21lc29u
OC1wb3dlci5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb244Yi1y
ZXNldC5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb244Yi1jbGtj
LXJlc2V0Lmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdGhlcm1hbC90aGVybWFsLmg+CiAjaW5j
bHVkZSAibWVzb24uZHRzaSIKIAogLyB7CkBAIC0yNiw2ICsyNyw3IEBAIGNwdTA6IGNwdUAyMDAg
ewogCQkJcmVzZXRzID0gPCZjbGtjIENMS0NfUkVTRVRfQ1BVMF9TT0ZUX1JFU0VUPjsKIAkJCW9w
ZXJhdGluZy1wb2ludHMtdjIgPSA8JmNwdV9vcHBfdGFibGU+OwogCQkJY2xvY2tzID0gPCZjbGtj
IENMS0lEX0NQVUNMSz47CisJCQkjY29vbGluZy1jZWxscyA9IDwyPjsgLyogbWluIGZvbGxvd2Vk
IGJ5IG1heCAqLwogCQl9OwogCiAJCWNwdTE6IGNwdUAyMDEgewpAQCAtMzcsNiArMzksNyBAQCBj
cHUxOiBjcHVAMjAxIHsKIAkJCXJlc2V0cyA9IDwmY2xrYyBDTEtDX1JFU0VUX0NQVTFfU09GVF9S
RVNFVD47CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZjcHVfb3BwX3RhYmxlPjsKIAkJCWNs
b2NrcyA9IDwmY2xrYyBDTEtJRF9DUFVDTEs+OworCQkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47IC8q
IG1pbiBmb2xsb3dlZCBieSBtYXggKi8KIAkJfTsKIAogCQljcHUyOiBjcHVAMjAyIHsKQEAgLTQ4
LDYgKzUxLDcgQEAgY3B1MjogY3B1QDIwMiB7CiAJCQlyZXNldHMgPSA8JmNsa2MgQ0xLQ19SRVNF
VF9DUFUyX1NPRlRfUkVTRVQ+OwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmY3B1X29wcF90
YWJsZT47CiAJCQljbG9ja3MgPSA8JmNsa2MgQ0xLSURfQ1BVQ0xLPjsKKwkJCSNjb29saW5nLWNl
bGxzID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkgbWF4ICovCiAJCX07CiAKIAkJY3B1MzogY3B1
QDIwMyB7CkBAIC01OSw2ICs2Myw3IEBAIGNwdTM6IGNwdUAyMDMgewogCQkJcmVzZXRzID0gPCZj
bGtjIENMS0NfUkVTRVRfQ1BVM19TT0ZUX1JFU0VUPjsKIAkJCW9wZXJhdGluZy1wb2ludHMtdjIg
PSA8JmNwdV9vcHBfdGFibGU+OwogCQkJY2xvY2tzID0gPCZjbGtjIENMS0lEX0NQVUNMSz47CisJ
CQkjY29vbGluZy1jZWxscyA9IDwyPjsgLyogbWluIGZvbGxvd2VkIGJ5IG1heCAqLwogCQl9Owog
CX07CiAKQEAgLTE2Nyw2ICsxNzIsNTQgQEAgaHdyb21AMCB7CiAJCX07CiAJfTsKIAorCXRoZXJt
YWwtem9uZXMgeworCQlzb2MgeworCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDI1MD47IC8q
IG1pbGxpc2Vjb25kcyAqLworCQkJcG9sbGluZy1kZWxheSA9IDwxMDAwPjsgLyogbWlsbGlzZWNv
bmRzICovCisJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRoZXJtYWxfc2Vuc29yPjsKKworCQkJY29v
bGluZy1tYXBzIHsKKwkJCQltYXAwIHsKKwkJCQkJdHJpcCA9IDwmc29jX3Bhc3NpdmU+OworCQkJ
CQljb29saW5nLWRldmljZSA9IDwmY3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElN
SVQ+LAorCQkJCQkJCSA8JmNwdTEgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwK
KwkJCQkJCQkgPCZjcHUyIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCisJCQkJ
CQkJIDwmY3B1MyBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAorCQkJCQkJCSA8
Jm1hbGkgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKKwkJCQl9OworCisJCQkJ
bWFwMSB7CisJCQkJCXRyaXAgPSA8JnNvY19ob3Q+OworCQkJCQljb29saW5nLWRldmljZSA9IDwm
Y3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAorCQkJCQkJCSA8JmNwdTEg
VEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKKwkJCQkJCQkgPCZjcHUyIFRIRVJN
QUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCisJCQkJCQkJIDwmY3B1MyBUSEVSTUFMX05P
X0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAorCQkJCQkJCSA8Jm1hbGkgVEhFUk1BTF9OT19MSU1J
VCBUSEVSTUFMX05PX0xJTUlUPjsKKwkJCQl9OworCQkJfTsKKworCQkJdHJpcHMgeworCQkJCXNv
Y19wYXNzaXZlOiBzb2MtcGFzc2l2ZSB7CisJCQkJCXRlbXBlcmF0dXJlID0gPDgwMDAwPjsgLyog
bWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1
cyAqLworCQkJCQl0eXBlID0gInBhc3NpdmUiOworCQkJCX07CisKKwkJCQlzb2NfaG90OiBzb2Mt
aG90IHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8OTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJ
CQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5cGUgPSAi
aG90IjsKKwkJCQl9OworCisJCQkJc29jX2NyaXRpY2FsOiBzb2MtY3JpdGljYWwgeworCQkJCQl0
ZW1wZXJhdHVyZSA9IDwxMTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNp
cyA9IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5cGUgPSAiY3JpdGljYWwiOwor
CQkJCX07CisJCQl9OworCQl9OworCX07CisKIAltbWNidXM6IGJ1c0BjODAwMDAwMCB7CiAJCWNv
bXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7CiAJCXJlZyA9IDwweGM4MDAwMDAwIDB4ODAwMD47CkBA
IC0yMjEsNiArMjc0LDcgQEAgbWFsaTogZ3B1QGMwMDAwIHsKIAkJCWNsb2NrcyA9IDwmY2xrYyBD
TEtJRF9DTEs4MT4sIDwmY2xrYyBDTEtJRF9NQUxJPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyIs
ICJjb3JlIjsKIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdwdV9vcHBfdGFibGU+OworCQkJ
I2Nvb2xpbmctY2VsbHMgPSA8Mj47IC8qIG1pbiBmb2xsb3dlZCBieSBtYXggKi8KIAkJfTsKIAl9
OwogfTsgLyogZW5kIG9mIC8gKi8KLS0gCjIuMjkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
