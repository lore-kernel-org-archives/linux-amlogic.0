Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A027CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=764rxtD8xG2eqfQ8csf6Jun+dzDXG4sipzZkLYvUxoo=; b=B0IbVvkX0Roq6G
	YBwoOsjcWXPbKAk0laIV/4RlkTdMj3cEyLFrtMLaKinPsjgljk8SBXG3adyJmaeGDMD7Jo00/yDe/
	OXhJZCG+dFSjN0tqAuqijv3q2fpYgacKpqK+damyFNd2RnZuKk9B46w+5H+eQDzduIvv5s66/+rp2
	9xXrH3oVViInlHhJBZJhp78qrog3habwj13njR+4J1zHhavLyu5D3wBZJMaCtXas6vqyz2/8ef/Fl
	09hrPyMGUBe7NIUuQdHGp9ag3l0e8Zwo2PAcsW7OAww4YOmHJ5sL8D6XRRHQ0pC569mUOqbwSLhDa
	0nVvLPKPTmR77y0jZOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGF0-00000008aaW-2fnF;
	Sat, 30 May 2026 09:44:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEx-00000008aYj-2yCe
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:44:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bc763e2ba8so74092055ad.3
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134263; x=1780739063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=Q5zmGMY1a2/UydhlI//gP+tSnX9d/FYfo3MeAxqLvUukCpKUjVJ7woWQOOw2gZe4qM
         bSEOaFrPyVO7D161YBczYCsvaxZ5VGFjiKqKiic7uqF0JobLE3ynKFxPbbWN7zXJrALs
         Eij6dK+xrW4QzckFnBcLNKqxGqvf0vxKYgAFN5xkKoA9Y6kuU9IBIDYF3WG39+4Zi2fa
         pjfpT6thdup9zrUW0LAPlo2ljwBGOfg9SHTh5pDSt1EwQWIry0w9JEiE0bM85/aoGzSw
         ZP4nPIw8S2Y1Ah0fefkwJGTu1nykTow2hiJfrVrbJjjblFZwku1dGMH+ZwjNM+4GYLCb
         FQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134263; x=1780739063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YD6axKKp8wDht90VyqGQ3zjwLyfLDF+g7zoFDStjFGA=;
        b=CYE+ZhEAJlqliOIDSNJ+fYKbDS1uD7YjYebjdNG72X+AfVd21WvJIBgbbm0ifd3pip
         qxcak2/eysCtTUUL13ZGKEFDk/wovfDnVOrfVYQE/u5B+0wjXc4ngj1UPfOFjeoKsakX
         gtD/miIBBwHHbmARsde3bzlVWx5ieOR2L77SBjzC7Wt3Z5yjQnactLje0Fu4yrenfdxp
         LLom5+jchPYZ53NMpobn7QABIcvLIBedt0wpGHJVkzGfmdycklNvw+Gi+YGTGR1sCezi
         kDSE9zVbWWTGS6Nusu+JjhPll7dfSceKlJZOjV/PU2v95/xODKQu9jmjOPwX2s6rOAQE
         H3Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9XCoQhr0iriyqYSDkxjdQC+j2ukx7/c9O+ED8PLoM3/YAkHK8wElZ+Rj54Kq2Ya5btdWftkFsv5i3qhrsF@lists.infradead.org
X-Gm-Message-State: AOJu0YwCuER0IP6B+HVGm/dl4xz+ghaLc2icUt1aKpis7C2iacyeZw38
	Nfg+Sv4lYA+vCC+czqgp1F1xfVrWdY8ltcJVTTLuD6fyfx23YCs/de5HOOUh5A==
X-Gm-Gg: Acq92OFtpyO2YagclAhOfH5Wmqe7TsaynkB7UR6xO+7tuQtHDhfyTxmL7wEF1jyXjlQ
	tIRp/3NuT4S2RLLdhh4SVkMgFR+LgodKTzcuCVsozKGZGvjrBWVtGJAFZoDt+nN6+xtBFseLOMw
	9OKKsGy5kOH1IXip7M14iVRHbxHEDlEU++QhvW3tLyxNVarP8wVlECf8zz7kfyTaLn/YgxE4Wex
	eX0bu7v6yEjLA35FlVFN2cgd8dnmQfquvhH43/CirfgMLQimER2sMyznd7FTIs30czcRTn4rXGe
	lWRdQykh/q4mxOULBz6hkztYi3bKL7AJ1rx/RYaL0/ZIMLWJ+klRVW4eKcseSpmbtXTs2jcalKb
	Pz+/QqacLqy3RHzmA5AX57YVShj9tNI99VmGcwFRp7K9CHNkwNZaFokDuhuYXyzW/iK3MWwsfph
	mm2ZvTycfFgNr1laQGY7WwQQY8+BUqCEs=
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr38817185ad.1.1780134262731;
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:22 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 2/8] media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race conditions
Date: Sat, 30 May 2026 15:12:48 +0530
Message-ID: <20260530094326.11892-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024423_744224_B7B6258C 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIE1lc29uIFZERUMgZHJpdmVy4oCZcyBzdGFydC9zdG9wIHN0cmVhbWluZyBwYXRocyBwcmV2
aW91c2x5CnVwZGF0ZWQgY29yZS0+Y3VyX3Nlc3MgYW5kIHNlc3MtPnN0YXR1cyB3aXRob3V0IHN5
bmNocm9uaXphdGlvbiwKbGVhdmluZyBhIHJhY2Ugd2luZG93IGJldHdlZW4gY29uY3VycmVudCBT
VFJFQU1PTi9TVFJFQU1PRkYgY2FsbHMuCgpGb2xsb3dpbmcgY2hhbmdlIGludHJvZHVjZXMgcHJv
cGVyIGxvY2tpbmcgZGlzY2lwbGluZToKCi0gSG9sZCBjb3JlLT5sb2NrIHdoZW4gY2hlY2tpbmcg
b3IgdXBkYXRpbmcgY29yZS0+Y3VyX3Nlc3MgYW5kCiAgc2Vzcy0+c3RhdHVzIGluIHZkZWNfc3Rh
cnRfc3RyZWFtaW5nKCkuCi0gU25hcHNob3Qgc2Vzcy0+c3RhdHVzIHVuZGVyIHRoZSBsb2NrIGlu
IHZkZWNfc3RvcF9zdHJlYW1pbmcoKQogIHRvIHNhZmVseSBldmFsdWF0ZSBoYXJkd2FyZSBzdGF0
ZSBhZnRlciByZWxlYXNpbmcgdGhlIG11dGV4LgotIEVuc3VyZSBlcnJvciB1bndpbmQgcGF0aHMg
Y2xlYXIgY29yZS0+Y3VyX3Nlc3MgYW5kIHJlc2V0CiAgc2Vzcy0+c3RhdHVzIGluc2lkZSB0aGUg
bG9jay4KClRoaXMgcHJldmVudHMgVE9DVE9VIHJhY2VzLCBhdm9pZHMgZGF0YSBjb3JydXB0aW9u
IHdoZW4gbXVsdGlwbGUKc2Vzc2lvbnMgY29udGVuZCBmb3IgdGhlIGhhcmR3YXJlLCBhbmQgZW5z
dXJlcyBjb25zaXN0ZW50IHNlc3Npb24KbGlmZWN5Y2xlIG1hbmFnZW1lbnQuCgpDYzogTmljb2xh
cyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+ClJlcG9ydGVkLWJ5OiBTYXNoaWtvIDxz
YXNoaWtvLWJvdEBrZXJuZWwub3JnPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI2MDUyNTEwNDM0NS5DOEQ1MDFGMDBBM0NAc210cC5rZXJuZWwub3JnLwpGaXhlczogM2U3
ZjUxYmQ5NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlkZW8gZGVjb2RlciBkcml2
ZXIiKQpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIHwgNjIgKysrKysrKysr
KysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVj
L3ZkZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwppbmRleCA0
ZmZlYmJhMjM0MWQuLjcyMzMwMDBlMjIzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL21lc29uL3ZkZWMvdmRlYy5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92
ZGVjL3ZkZWMuYwpAQCAtMjg2LDExICsyODYsNiBAQCBzdGF0aWMgaW50IHZkZWNfc3RhcnRfc3Ry
ZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEsIHVuc2lnbmVkIGludCBjb3VudCkKIAlzdHJ1Y3Qg
dmIyX3Y0bDJfYnVmZmVyICpidWY7CiAJaW50IHJldDsKIAotCWlmIChjb3JlLT5jdXJfc2VzcyAm
JiBjb3JlLT5jdXJfc2VzcyAhPSBzZXNzKSB7Ci0JCXJldCA9IC1FQlVTWTsKLQkJZ290byBidWZz
X2RvbmU7Ci0JfQotCiAJaWYgKHEtPnR5cGUgPT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVRf
TVBMQU5FKQogCQlzZXNzLT5zdHJlYW1vbl9vdXQgPSAxOwogCWVsc2UKQEAgLTMwOCw5ICszMDMs
MjkgQEAgc3RhdGljIGludCB2ZGVjX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpx
LCB1bnNpZ25lZCBpbnQgY291bnQpCiAJfQogCiAJaWYgKHNlc3MtPnN0YXR1cyA9PSBTVEFUVVNf
UlVOTklORyB8fAotCSAgICBzZXNzLT5zdGF0dXMgPT0gU1RBVFVTX05FRURTX1JFU1VNRSB8fAot
CSAgICBzZXNzLT5zdGF0dXMgPT0gU1RBVFVTX0lOSVQpCisJICAgIHNlc3MtPnN0YXR1cyA9PSBT
VEFUVVNfTkVFRFNfUkVTVU1FKQorCQlyZXR1cm4gMDsKKworCS8qCisJICogU2VjdXJlIHRoZSBj
b3JlIGhhcmR3YXJlIGxvY2sgYmVmb3JlIGNoZWNraW5nIGF2YWlsYWJpbGl0eQorCSAqIGFuZCB1
cGRhdGluZyBzZXNzaW9uIHN0YXRlcyB0byBwcmV2ZW50IFNUUkVBTU9OIHJhY2UgY29uZGl0aW9u
cy4KKwkgKi8KKwltdXRleF9sb2NrKCZjb3JlLT5sb2NrKTsKKwlpZiAoY29yZS0+Y3VyX3Nlc3Mg
JiYgY29yZS0+Y3VyX3Nlc3MgIT0gc2VzcykgeworCQltdXRleF91bmxvY2soJmNvcmUtPmxvY2sp
OworCQlyZXQgPSAtRUJVU1k7CisJCWdvdG8gYnVmc19kb25lOworCX0KKworCS8qIElmIGFscmVh
ZHkgaGFsZi1pbml0aWFsaXplZCwgZG8gbm90IHJlLWluaXRpYWxpemUgKi8KKwlpZiAoc2Vzcy0+
c3RhdHVzID09IFNUQVRVU19JTklUKSB7CisJCW11dGV4X3VubG9jaygmY29yZS0+bG9jayk7CiAJ
CXJldHVybiAwOworCX0KKworCXNlc3MtPnN0YXR1cyA9IFNUQVRVU19JTklUOworCWNvcmUtPmN1
cl9zZXNzID0gc2VzczsKKwltdXRleF91bmxvY2soJmNvcmUtPmxvY2spOwogCiAJc2Vzcy0+dmlm
aWZvX3NpemUgPSBTSVpFX1ZJRklGTzsKIAlzZXNzLT52aWZpZm9fdmFkZHIgPQpAQCAtMzQxLDgg
KzM1Niw2IEBAIHN0YXRpYyBpbnQgdmRlY19zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1
ZSAqcSwgdW5zaWduZWQgaW50IGNvdW50KQogCQlzZXNzLT5yZWN5Y2xlX3RocmVhZCA9IGt0aHJl
YWRfcnVuKHZkZWNfcmVjeWNsZV90aHJlYWQsIHNlc3MsCiAJCQkJCQkgICAidmRlY19yZWN5Y2xl
Iik7CiAKLQlzZXNzLT5zdGF0dXMgPSBTVEFUVVNfSU5JVDsKLQljb3JlLT5jdXJfc2VzcyA9IHNl
c3M7CiAJc2NoZWR1bGVfd29yaygmc2Vzcy0+ZXNwYXJzZXJfcXVldWVfd29yayk7CiAJcmV0dXJu
IDA7CiAKQEAgLTM1MCw2ICszNjMsMTIgQEAgc3RhdGljIGludCB2ZGVjX3N0YXJ0X3N0cmVhbWlu
ZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQpCiAJZG1hX2ZyZWVfY29o
ZXJlbnQoc2Vzcy0+Y29yZS0+ZGV2LCBzZXNzLT52aWZpZm9fc2l6ZSwKIAkJCSAgc2Vzcy0+dmlm
aWZvX3ZhZGRyLCBzZXNzLT52aWZpZm9fcGFkZHIpOwogYnVmc19kb25lOgorCW11dGV4X2xvY2so
JmNvcmUtPmxvY2spOworCWlmIChjb3JlLT5jdXJfc2VzcyA9PSBzZXNzKQorCQljb3JlLT5jdXJf
c2VzcyA9IE5VTEw7CisJc2Vzcy0+c3RhdHVzID0gU1RBVFVTX1NUT1BQRUQ7CisJbXV0ZXhfdW5s
b2NrKCZjb3JlLT5sb2NrKTsKKwogCXdoaWxlICgoYnVmID0gdjRsMl9tMm1fc3JjX2J1Zl9yZW1v
dmUoc2Vzcy0+bTJtX2N0eCkpKQogCQl2NGwyX20ybV9idWZfZG9uZShidWYsIFZCMl9CVUZfU1RB
VEVfUVVFVUVEKTsKIAl3aGlsZSAoKGJ1ZiA9IHY0bDJfbTJtX2RzdF9idWZfcmVtb3ZlKHNlc3Mt
Pm0ybV9jdHgpKSkKQEAgLTM5OSwxMCArNDE4LDIzIEBAIHN0YXRpYyB2b2lkIHZkZWNfc3RvcF9z
dHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkKIAlzdHJ1Y3QgYW12ZGVjX2NvZGVjX29wcyAq
Y29kZWNfb3BzID0gc2Vzcy0+Zm10X291dC0+Y29kZWNfb3BzOwogCXN0cnVjdCBhbXZkZWNfY29y
ZSAqY29yZSA9IHNlc3MtPmNvcmU7CiAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqYnVmOworCWVu
dW0gYW12ZGVjX3N0YXR1cyBvbGRfc3RhdHVzOwogCi0JaWYgKHNlc3MtPnN0YXR1cyA9PSBTVEFU
VVNfUlVOTklORyB8fAotCSAgICBzZXNzLT5zdGF0dXMgPT0gU1RBVFVTX0lOSVQgfHwKLQkgICAg
KHNlc3MtPnN0YXR1cyA9PSBTVEFUVVNfTkVFRFNfUkVTVU1FICYmCisJLyoKKwkgKiBTYWZlbHkg
c25hcHNob3QgdGhlIHN0YXR1cyBhbmQgY2xlYXIgdGhlIGhhcmR3YXJlIG93bmVyIGluc2lkZQor
CSAqIHRoZSBtdXRleCB0byBwcmV2ZW50IGRhdGEgcmFjZXMgd2l0aCBjb25jdXJyZW50IFNUUkVB
TU9OIHJlcXVlc3RzLgorCSAqLworCW11dGV4X2xvY2soJmNvcmUtPmxvY2spOworCW9sZF9zdGF0
dXMgPSBzZXNzLT5zdGF0dXM7CisJaWYgKGNvcmUtPmN1cl9zZXNzID09IHNlc3MpCisJCWNvcmUt
PmN1cl9zZXNzID0gTlVMTDsKKwlzZXNzLT5zdGF0dXMgPSBTVEFUVVNfU1RPUFBFRDsKKwltdXRl
eF91bmxvY2soJmNvcmUtPmxvY2spOworCisJLyogRXZhbHVhdGUgdGhlIGhhcmR3YXJlIHN0YXRl
IHVzaW5nIG91ciBzbmFwc2hvdCAqLworCWlmIChvbGRfc3RhdHVzID09IFNUQVRVU19SVU5OSU5H
IHx8CisJICAgIG9sZF9zdGF0dXMgPT0gU1RBVFVTX0lOSVQgfHwKKwkgICAgKG9sZF9zdGF0dXMg
PT0gU1RBVFVTX05FRURTX1JFU1VNRSAmJgogCSAgICAgKCFzZXNzLT5zdHJlYW1vbl9vdXQgfHwg
IXNlc3MtPnN0cmVhbW9uX2NhcCkpKSB7CiAJCWlmICh2ZGVjX2NvZGVjX25lZWRzX3JlY3ljbGUo
c2VzcykpCiAJCQlrdGhyZWFkX3N0b3Aoc2Vzcy0+cmVjeWNsZV90aHJlYWQpOwpAQCAtNDE1LDgg
KzQ0Nyw2IEBAIHN0YXRpYyB2b2lkIHZkZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1
ZSAqcSkKIAkJdmRlY19yZXNldF9idWZzX3JlY3ljbGUoc2Vzcyk7CiAJCWtmcmVlKHNlc3MtPnBy
aXYpOwogCQlzZXNzLT5wcml2ID0gTlVMTDsKLQkJY29yZS0+Y3VyX3Nlc3MgPSBOVUxMOwotCQlz
ZXNzLT5zdGF0dXMgPSBTVEFUVVNfU1RPUFBFRDsKIAl9CiAKIAlpZiAocS0+dHlwZSA9PSBWNEwy
X0JVRl9UWVBFX1ZJREVPX09VVFBVVF9NUExBTkUpIHsKQEAgLTQyNSw4ICs0NTUsOCBAQCBzdGF0
aWMgdm9pZCB2ZGVjX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEpCiAKIAkJc2Vz
cy0+c3RyZWFtb25fb3V0ID0gMDsKIAl9IGVsc2UgewotCQkvKiBEcmFpbiByZW1haW5pbmcgcmVm
cyBpZiB3YXMgc3RpbGwgcnVubmluZyAqLwotCQlpZiAoc2Vzcy0+c3RhdHVzID49IFNUQVRVU19S
VU5OSU5HICYmIGNvZGVjX29wcy0+ZHJhaW4pCisJCS8qIERyYWluIHJlbWFpbmluZyByZWZzIGlm
IHdhcyBzdGlsbCBydW5uaW5nIHVzaW5nIHRoZSBzbmFwc2hvdCAqLworCQlpZiAob2xkX3N0YXR1
cyA+PSBTVEFUVVNfUlVOTklORyAmJiBjb2RlY19vcHMtPmRyYWluKQogCQkJY29kZWNfb3BzLT5k
cmFpbihzZXNzKTsKIAogCQl3aGlsZSAoKGJ1ZiA9IHY0bDJfbTJtX2RzdF9idWZfcmVtb3ZlKHNl
c3MtPm0ybV9jdHgpKSkKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
