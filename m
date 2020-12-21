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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D86C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3020822D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3020822D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zVE/V/iDQhLle7A+nLi3Mdn/3WOzjScRylc1uJ7Nlkc=; b=2coBFI5zCCacJRF+OqSDGEEnt
	JqOaYqGId3yb+OUd8Aqa1ZUzaUbB6VBi8nGBJuUvJJGrhaE5Vi2fG67+ASK5Q5PSc4a47Vs2QRopK
	9cYVgC2vCdtRE0ZxDvcM8BcL7AJ7H1N+MvX/bneoetC1D/vk3HwM3VxXhD9fmTs+23GnFnibZxzNz
	UHL4WFgsx1Sww4jXYhmOdQbl5etV72Yi7B8SZrPz2Iy7a6sOz6Zm2wFQSwaDj1Vt4Abky22/jeHdE
	6VtRYpKUjS7Cl4yx/hy3cPfJFn2x/uCNEtToGQKqQLX/uDE33Y2qgUqiVRnf+WSpcLRnyLPWclT4T
	ND1fUSOuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPgt-0001vJ-3b; Mon, 21 Dec 2020 18:13:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgk-0001rj-E0; Mon, 21 Dec 2020 18:13:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id a6so10724165wmc.2;
 Mon, 21 Dec 2020 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+KwutHWyzn9PxtO0N7Iinmf9zYdkryZ816NS71BKk8=;
 b=ldqnx1j7Ks6lRYx/UBvTxWvpVOMc1MSs4mTUo2PPiSCjT6jKuSWNo1JatbusOuJ5d+
 G0pp1XqnL/0Jk3u8aJdk3wBIvWX3b+0Bq4Z0xUbSUntDV1j05E9OA8bZOYVOnwmqoVv7
 HtgUOw/+DshQZ70V/JebtPpcyiW7frdWWj4ggztpLzJkemtTCsMn4YL39kX1M9cClw7+
 8SBiSZuPWEBUAfvjRtGebyBQLpVkhX7OyL76V8gygAyaw/JYinZesGpBnKxh4aBFk3iP
 R/jL7T3NmSuQhPlWt3mvIEHG19LUwN6VJI+ngNC7Iw4KkcRs9Cav4T8xa7sH9KYrSpGB
 E67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+KwutHWyzn9PxtO0N7Iinmf9zYdkryZ816NS71BKk8=;
 b=aBIH8xKTu9JdX7uc8e8cjkDKT5/c8ImZTgWCUQ5LU4i/OUXK1BnGZ+CyUoEGBUXmD/
 ZD9r/IQMXIhe7S+GtfMmpjy0fklBYc3iOy1n3E2ouGyNCDeY/riGS4ziO8P37ExCiaIB
 qfGJmSc4spsKNnIikL6mquo/7rNq6JNSGdOKd3isd0FjyzIEjyaejeZ2tg56n21lIawC
 iXKN+tCvZZVc/Xwb11KnRs0h2w+XXU4jhgh4NggkhhzVa8qucqgspHYdQnWhjNcuBgKq
 KsWMZYGt0wv2hVl36ZkwHiXJ4An5RlOQCnYnohuSNYJd+PrqGMXXB4UL2VCU1LmkfgRo
 HUFQ==
X-Gm-Message-State: AOAM533blG2dBejA/mBmPu5Hqc31drAe6Ry60v2eXSVuucFuW+lc+8Yn
 vd3FO7l0RgS0MUI7OLmZ0KqwZ8a6dfU=
X-Google-Smtp-Source: ABdhPJwf8vXQx3eHs+teSa2YTnl5HqIFCWKxtP2N2IDsGLEMXb60Hsx2tBX///tGDY966BvVeROyIQ==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr17753384wmr.162.1608574420525; 
 Mon, 21 Dec 2020 10:13:40 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/5] ARM: dts: meson8: add the thermal-zones with cooling
 configuration
Date: Mon, 21 Dec 2020 19:13:04 +0100
Message-Id: <20201221181306.904272-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131342_532407_6E2263BE 
X-CRM114-Status: GOOD (  17.00  )
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
czoKPD0gNzDCsEM6Ci0gQ1BVIGZyZXF1ZW5jeSBsaW1pdGVkIHRvIDEuNjA4R0h6Ci0gR1BVIGxp
bWl0ZWQgdG8gNTExTUh6IGFuZCA1IGNvcmVzIChwaXhlbCBwcm9jZXNzb3JzKQoKPD0gODDCsEM6
Ci0gQ1BVIGZyZXF1ZW5jeSBsaW1pdGVkIHRvIDEuMkdIegotIEdQVSBsaW1pdGVkIHRvIDQzNU1I
eiBhbmQgNCBjb3JlcyAocGl4ZWwgcHJvY2Vzc29ycykKCjw9IDkwwrBDOgotIENQVSBmcmVxdWVu
Y3kgbGltaXRlZCB0byAwLjgwNEdIegotIEdQVSBsaW1pdGVkIHRvIDMyOE1IeiBhbmQgMyBjb3Jl
cyAocGl4ZWwgcHJvY2Vzc29ycykKCkFkZCBzaW1wbGlmaWVkIHRoZXJtYWwgY29uZmlndXJhdGlv
biB3aGljaCBpcyB0YWtlbiBmcm9tIHRoZQpHWEJCL0dYTC9HWE0gU29DIGZhbWlseSAod2hpY2gg
dXNlcyB0aGUgc2FtZSBtYW51ZmFjdHVyaW5nIHByb2Nlc3MgYW5kCmhhcyB0aGUgc2FtZSBtYXhp
bXVtIGp1bmN0aW9uIHRlbXBlcmF0dXJlIG9mIDEyNcKwQykuIFdpdGggdGhpcyB0aGUKdGhlcm1h
bCBmcmFtZXdvcmsgd2lsbCB0cnkgdG8ga2VlcCB0aGUgU29DIHRlbXBlcmF0dXJlIGF0IG9yIGJl
bG93IDgwwrBDCndoaWNoIGlzIGlkZW50aWNhbCB0byB0aGUgdmVuZG9yIGtlcm5lbCAod2l0aCB0
aGUgZXhjZXB0aW9uIG9mIG9uZSBHUFUKcGl4ZWwgcHJvY2Vzc29yKS4KClRoZSBudW1iZXIgb2Yg
R1BVIGNvcmVzIGFyZSBub3QgdGFrZW4gaW50byBhY2NvdW50IGFzIHRoaXMgaXMgbm90CnN1cHBv
cnRlZC4KClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvbWVzb244LmR0c2kg
fCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDU0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tZXNvbjgu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOC5kdHNpCmluZGV4IDA0Njg4ZThhYmNlMi4u
NDIwMzI0ZWEyYWQ3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9tZXNvbjguZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9tZXNvbjguZHRzaQpAQCAtOSw2ICs5LDcgQEAKICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZXNvbjgtcG93ZXIuaD4KICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uOGItY2xrYy1yZXNldC5oPgogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb244Yi1yZXNldC5oPgorI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3RoZXJtYWwvdGhlcm1hbC5oPgogI2luY2x1ZGUgIm1lc29uLmR0c2kiCiAKIC8gewpAQCAt
MjgsNiArMjksNyBAQCBjcHUwOiBjcHVAMjAwIHsKIAkJCXJlc2V0cyA9IDwmY2xrYyBDTEtDX1JF
U0VUX0NQVTBfU09GVF9SRVNFVD47CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZjcHVfb3Bw
X3RhYmxlPjsKIAkJCWNsb2NrcyA9IDwmY2xrYyBDTEtJRF9DUFVDTEs+OworCQkJI2Nvb2xpbmct
Y2VsbHMgPSA8Mj47IC8qIG1pbiBmb2xsb3dlZCBieSBtYXggKi8KIAkJfTsKIAogCQljcHUxOiBj
cHVAMjAxIHsKQEAgLTM5LDYgKzQxLDcgQEAgY3B1MTogY3B1QDIwMSB7CiAJCQlyZXNldHMgPSA8
JmNsa2MgQ0xLQ19SRVNFVF9DUFUxX1NPRlRfUkVTRVQ+OwogCQkJb3BlcmF0aW5nLXBvaW50cy12
MiA9IDwmY3B1X29wcF90YWJsZT47CiAJCQljbG9ja3MgPSA8JmNsa2MgQ0xLSURfQ1BVQ0xLPjsK
KwkJCSNjb29saW5nLWNlbGxzID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkgbWF4ICovCiAJCX07
CiAKIAkJY3B1MjogY3B1QDIwMiB7CkBAIC01MCw2ICs1Myw3IEBAIGNwdTI6IGNwdUAyMDIgewog
CQkJcmVzZXRzID0gPCZjbGtjIENMS0NfUkVTRVRfQ1BVMl9TT0ZUX1JFU0VUPjsKIAkJCW9wZXJh
dGluZy1wb2ludHMtdjIgPSA8JmNwdV9vcHBfdGFibGU+OwogCQkJY2xvY2tzID0gPCZjbGtjIENM
S0lEX0NQVUNMSz47CisJCQkjY29vbGluZy1jZWxscyA9IDwyPjsgLyogbWluIGZvbGxvd2VkIGJ5
IG1heCAqLwogCQl9OwogCiAJCWNwdTM6IGNwdUAyMDMgewpAQCAtNjEsNiArNjUsNyBAQCBjcHUz
OiBjcHVAMjAzIHsKIAkJCXJlc2V0cyA9IDwmY2xrYyBDTEtDX1JFU0VUX0NQVTNfU09GVF9SRVNF
VD47CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZjcHVfb3BwX3RhYmxlPjsKIAkJCWNsb2Nr
cyA9IDwmY2xrYyBDTEtJRF9DUFVDTEs+OworCQkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47IC8qIG1p
biBmb2xsb3dlZCBieSBtYXggKi8KIAkJfTsKIAl9OwogCkBAIC0xOTAsNiArMTk1LDU0IEBAIHBv
d2VyLWZpcm13YXJlQDRmMDAwMDAgewogCQl9OwogCX07CiAKKwl0aGVybWFsLXpvbmVzIHsKKwkJ
c29jIHsKKwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwyNTA+OyAvKiBtaWxsaXNlY29uZHMg
Ki8KKwkJCXBvbGxpbmctZGVsYXkgPSA8MTAwMD47IC8qIG1pbGxpc2Vjb25kcyAqLworCQkJdGhl
cm1hbC1zZW5zb3JzID0gPCZ0aGVybWFsX3NlbnNvcj47CisKKwkJCWNvb2xpbmctbWFwcyB7CisJ
CQkJbWFwMCB7CisJCQkJCXRyaXAgPSA8JnNvY19wYXNzaXZlPjsKKwkJCQkJY29vbGluZy1kZXZp
Y2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKKwkJCQkJCQkg
PCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCisJCQkJCQkJIDwmY3B1
MiBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAorCQkJCQkJCSA8JmNwdTMgVEhF
Uk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKKwkJCQkJCQkgPCZtYWxpIFRIRVJNQUxf
Tk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CisJCQkJfTsKKworCQkJCW1hcDEgeworCQkJCQl0
cmlwID0gPCZzb2NfaG90PjsKKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9O
T19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKKwkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElN
SVQgVEhFUk1BTF9OT19MSU1JVD4sCisJCQkJCQkJIDwmY3B1MiBUSEVSTUFMX05PX0xJTUlUIFRI
RVJNQUxfTk9fTElNSVQ+LAorCQkJCQkJCSA8JmNwdTMgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFM
X05PX0xJTUlUPiwKKwkJCQkJCQkgPCZtYWxpIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19M
SU1JVD47CisJCQkJfTsKKwkJCX07CisKKwkJCXRyaXBzIHsKKwkJCQlzb2NfcGFzc2l2ZTogc29j
LXBhc3NpdmUgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDw4MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAq
LworCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJdHlw
ZSA9ICJwYXNzaXZlIjsKKwkJCQl9OworCisJCQkJc29jX2hvdDogc29jLWhvdCB7CisJCQkJCXRl
bXBlcmF0dXJlID0gPDkwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMg
PSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImhvdCI7CisJCQkJfTsK
KworCQkJCXNvY19jcml0aWNhbDogc29jLWNyaXRpY2FsIHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8
MTEwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8q
IG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImNyaXRpY2FsIjsKKwkJCQl9OworCQkJfTsK
KwkJfTsKKwl9OworCiAJbW1jYnVzOiBidXNAYzgwMDAwMDAgewogCQljb21wYXRpYmxlID0gInNp
bXBsZS1idXMiOwogCQlyZWcgPSA8MHhjODAwMDAwMCAweDgwMDA+OwpAQCAtMjU0LDYgKzMwNyw3
IEBAIG1hbGk6IGdwdUBjMDAwMCB7CiAJCQljbG9ja3MgPSA8JmNsa2MgQ0xLSURfQ0xLODE+LCA8
JmNsa2MgQ0xLSURfTUFMST47CiAJCQljbG9jay1uYW1lcyA9ICJidXMiLCAiY29yZSI7CiAJCQlv
cGVyYXRpbmctcG9pbnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsKKwkJCSNjb29saW5nLWNlbGxz
ID0gPDI+OyAvKiBtaW4gZm9sbG93ZWQgYnkgbWF4ICovCiAJCX07CiAJfTsKIH07IC8qIGVuZCBv
ZiAvICovCi0tIAoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
