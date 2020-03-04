Return-Path: <SRS0=8tFv=4V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DE0C3F2DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 10:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D4E224654
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 10:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsHMyZIW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UlLnoNwk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D4E224654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhC0ba+VVfDZHQ1dDzFytXnjNBDHDH0RqI9Hbr9wDis=; b=qsHMyZIWHyaxyu
	xKnl/WPv52UJXAlSrsi7soHQz/2HBFJIrbHo0KYayORw2rMYx9xp+bDvun3laRriT/px66+wo6rEW
	Nn8wp7mFDYgvphIt8P+JhX1WmRYXJaRjss3xuzIERrE8+/Ezf+RB6v3ej+WLHJYLU1V0IZZLHxKgI
	XklUFNJWr8AH/OuTx5tGtPL4vCP0ZN2WxR05YMsIH9aG/gnBSWHggUv92UNjg3ZiuFEZbNKTd+4UR
	tCB1nEWD0up5aCmRtwK+AnpZ3btxsat6/rr+dCH/t1C57Y98yFQKbfCdCRmUnHxjLNIAlAf7iSt0Z
	tjM+Bs2EWXS/nmuoG4bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9RSo-0007Pf-Ai; Wed, 04 Mar 2020 10:41:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RSf-00079o-SV
 for linux-amlogic@lists.infradead.org; Wed, 04 Mar 2020 10:41:11 +0000
Received: by mail-wr1-x441.google.com with SMTP id x7so1787810wrr.0
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2020 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1GUIN7KBO8lXS2YCrGPVdl4nGtrL7ahFAkqfmqdfyk=;
 b=UlLnoNwk9f5kegUhbueRDDWxZmwwbTz/9mK+jbJqiY+TA5vkYqqeQEZSng7llq7Ln6
 3XpI+06DOJVJceGP5no37stEXbDHZ9K4e2HgIdYK6KzzQfx4tN6dZKpckkjjYtiqaD4U
 0ocl7+LLwqGahhZMCEC2sKutkJSzaJfrJA07Ci2+EHpXnlVdi2gItXlFoaE04b7Rmikb
 uWbA0hC9Pp8iG18Sg88HEaQABd8tzPImtE1jI2GiYyjRayS8JxOyx70SvBrjABZIJd3S
 EU6XkbgbaUbzirFLd1Gep8pcDuB8xylF8PtdRjXQ2pg9CPjtqdFRRoabYHLvUP0DUY5x
 KVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1GUIN7KBO8lXS2YCrGPVdl4nGtrL7ahFAkqfmqdfyk=;
 b=ne0xQIPwwv1N6D19p/wDYvJr4pZCSXSli0nvU9XoaCzcnXkhbt3rDlrLRcXVQkSq9E
 HBlaoZS+8xMiCGf4+wksJdxiOrk789k4KrcQUylqB/gI+/WQ9EgZDyFdEmIsXNSYSyxv
 srtlRXsRnwiZwClKk/vfbtxqUJQIYOU32SPhORn/kh1OiwA4NEes1t203vVsF1OfuKrB
 c42aUurH2oGeFa1l2kIPt/0mFNbhcCU71wQeSeMDLzNrf5zXbAQW2ShOiOjvoFTe9QZz
 De+23DLF8+AUzvxVVoG4V91BuquA1/nMu8oIS65enTwCBBJZCkYY+9nBuIyEUhlpJDcZ
 ENnw==
X-Gm-Message-State: ANhLgQ0QFh7dLMzUpvMlC377CO7UrsRlVJPTnSjWhJSZZCR+TZ754cYV
 X3DYWv0g79PWfJuIIB/KWCWs/m94U1LkCg==
X-Google-Smtp-Source: ADFU+vvS03o6Ek7ni9t7Qukh+4J0GibYOTSNDC/K49iSwuqzgXiSA2El3UXkF9I+ytl2/KPQDxRQLQ==
X-Received: by 2002:adf:90cd:: with SMTP id i71mr3254354wri.63.1583318468390; 
 Wed, 04 Mar 2020 02:41:08 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 09/11] drm/meson: venc: add support for YUV420 setup
Date: Wed,  4 Mar 2020 11:40:50 +0100
Message-Id: <20200304104052.17196-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_024109_984255_9281AA64 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBhZGRzIGVuY29kaW5nIHN1cHBvcnQgZm9yIHRoZSBZVVY0MjAgb3V0cHV0IGZy
b20gdGhlCkFtbG9naWMgTWVzb24gU29DcyBWaWRlbyBQcm9jZXNzaW5nIFVuaXQgdG8gdGhlIEhE
TUkgQ29udHJvbGxlci4KClRoZSBZVVY0MjAgaXMgb2J0YWluZWQgYnkgZ2VuZXJhdGluZyBhIFlV
VjQ0NCBwaXhlbCBzdHJlYW0gbGlrZQp0aGUgY2xhc3NpYyBIRE1JIGRpc3BsYXkgbW9kZXMsIGJ1
dCB0aGVuIHRoZSBWaWRlbyBFbmNvZGVyIG91dHB1dApjYW4gYmUgY29uZmlndXJlZCB0byBkb3du
LXNhbXBsZSB0aGUgWVVWNDQ0IHBpeGVsIHN0cmVhbSB0byBhIFlVVjQyMApzdHJlYW0uCgpJbiBh
ZGRpdGlvbiBpZiBwaXhlbCBzdHJlYW0gZG93bi1zYW1wbGluZywgdGhlIFkgQ2IgQ3IgY29tcG9u
ZW50cyBtdXN0CmFsc28gYmUgbWFwcGVkIGRpZmZlcmVudGx5IHRvIGFsaWduIHdpdGggdGhlIEhE
TUkyLjAgc3BlY2lmaWNhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5l
ai5za3JhYmVjQHNpb2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMgfCAzICsrLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyAgICB8IDgg
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmggICAgfCAyICsrCiAz
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwppbmRleCA3MmMxMTgxNDJlYWYuLmIyMTA1YzBmZTIw
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCkBAIC03NTIsNyArNzUyLDgg
QEAgc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2VuY29kZXJfbW9kZV9zZXQoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwKIAlEUk1fREVCVUdfRFJJVkVSKCJcIiVzXCIgdmljICVkXG4iLCBt
b2RlLT5uYW1lLCB2aWMpOwogCiAJLyogVkVOQyArIFZFTkMtRFZJIE1vZGUgc2V0dXAgKi8KLQlt
ZXNvbl92ZW5jX2hkbWlfbW9kZV9zZXQocHJpdiwgdmljLCBtb2RlKTsKKwltZXNvbl92ZW5jX2hk
bWlfbW9kZV9zZXQocHJpdiwgdmljLCB5Y3JjYl9tYXAsIGZhbHNlLAorCQkJCSBWUFVfSERNSV9P
VVRQVVRfQ0JZQ1IpOwogCiAJLyogVkNMSyBTZXQgY2xvY2sgKi8KIAlkd19oZG1pX3NldF92Y2xr
KGR3X2hkbWksIG1vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKaW5kZXggYTlhYjc4
OTcwYmZlLi5mOTNjNzI1YjZmMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl92ZW5jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwpAQCAt
OTQ2LDYgKzk0Niw4IEBAIGJvb2wgbWVzb25fdmVuY19oZG1pX3ZlbmNfcmVwZWF0KGludCB2aWMp
CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfdmVuY19yZXBlYXQpOwogCiB2b2lk
IG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgdmlj
LAorCQkJICAgICAgdW5zaWduZWQgaW50IHljcmNiX21hcCwKKwkJCSAgICAgIGJvb2wgeXV2NDIw
X21vZGUsCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsK
IAl1bmlvbiBtZXNvbl9oZG1pX3ZlbmNfbW9kZSAqdm1vZGUgPSBOVUxMOwpAQCAtMTUyOCwxNCAr
MTUzMCwxNCBAQCB2b2lkIG1lc29uX3ZlbmNfaGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJt
ICpwcml2LCBpbnQgdmljLAogCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUFZTWU5D
KQogCQlyZWcgfD0gVlBVX0hETUlfSU5WX1ZTWU5DOwogCi0JLyogT3V0cHV0IGRhdGEgZm9ybWF0
OiBDYllDciAqLwotCXJlZyB8PSBWUFVfSERNSV9PVVRQVVRfQ0JZQ1I7CisJLyogT3V0cHV0IGRh
dGEgZm9ybWF0ICovCisJcmVnIHw9IHljcmNiX21hcDsKIAogCS8qCiAJICogV3JpdGUgcmF0ZSB0
byB0aGUgYXN5bmMgRklGTyBiZXR3ZWVuIFZFTkMgYW5kIEhETUkuCiAJICogT25lIHdyaXRlIGV2
ZXJ5IDIgd3JfY2xrLgogCSAqLwotCWlmICh2ZW5jX3JlcGVhdCkKKwlpZiAodmVuY19yZXBlYXQg
fHwgeXV2NDIwX21vZGUpCiAJCXJlZyB8PSBWUFVfSERNSV9XUl9SQVRFKDIpOwogCiAJLyoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmggYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCmluZGV4IDFhYmRjYmRmNTFjMC4uOTEzODI1NWZmYzll
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKQEAgLTYwLDYgKzYwLDggQEAgZXh0ZXJu
IHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSBtZXNvbl9jdmJzX2VuY2lfbnRzYzsKIHZvaWQg
bWVzb25fdmVuY2lfY3Zic19tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LAogCQkJICAg
ICAgIHN0cnVjdCBtZXNvbl9jdmJzX2VuY2lfbW9kZSAqbW9kZSk7CiB2b2lkIG1lc29uX3ZlbmNf
aGRtaV9tb2RlX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgdmljLAorCQkJICAgICAg
dW5zaWduZWQgaW50IHljcmNiX21hcCwKKwkJCSAgICAgIGJvb2wgeXV2NDIwX21vZGUsCiAJCQkg
ICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7CiB1bnNpZ25lZCBpbnQg
bWVzb25fdmVuY2lfZ2V0X2ZpZWxkKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpOwogCi0tIAoyLjIy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
