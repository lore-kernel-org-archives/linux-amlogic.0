Return-Path: <SRS0=gULv=G5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FBEC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 08:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13398206FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 08:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13398206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTz62xeMdPtxnoUPDaVJ0CpmYBMVcQPb/6SjWDi9L34=; b=2ax3JHVmPVh5zxhZts29kis4X7
	2ABRgbx4mMfCTnBXBJM6MC9dEElrF3hD5kfrGdcrb2wJRGLPINRDgYhmxebbk8wZm8lh+i65g0pvk
	4TgW0VgamrLXGfIF6yKlYjXyn2nQCABG2SYINJ37VNZM6TecwqTw4HR4NL/82fyQ5YdXvIQtu4ixJ
	+AvryzyAnOT/qwKdnImaukAhUjxzDuvpAtD/ewBFp4n8cWI2GkyZ9k5lu/XTPb7TKlne8NG11gW2/
	sj5sxRgkbgX/zzIhyMTprMCNEnspM6TidqehW5cFrhK8h3ggO7UZzY1KMB9p9xVu5MBWWBDwtNla0
	7gHBTvzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4JQL-0000kO-Rs; Tue, 26 Jan 2021 08:10:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4JQF-0000i4-Kp
 for linux-amlogic@lists.infradead.org; Tue, 26 Jan 2021 08:10:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c128so1888285wme.2
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Jan 2021 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKVzDfUlQORvUNQIyh1sGOYZQD9pBhXKJEodxKHGxUE=;
 b=FIogEhBVacSyx3uxTnBOjRkSnqfQvJa/Qf5CS/5ZgsfB4pQr+sePDse0GY2rMFTiyl
 f7VkQzsEhci/6CxECtBB5SMWVKuIV8sSvmOfqQzfEgKZMyZYM+KXR8rdGDegzssF92I7
 4bFDwCVMi+SsBwHT5tbrlw958MYAG6fnvTptqZPcpVocBA8xtPjegGp/WFmT1t3hwmlV
 fAk4ZTwy+v0y36yz0hxbKwx5jDq2EXlwiT+mERdbmDJV0s7fvFZWnrSzCSdx6DYGzgWG
 qqwY2MkWxo2b8VKMqzBmi20cbBZzWr4402fu5eMeKXW6tq76fQ1cBIwAEaydSxcNlkev
 hXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKVzDfUlQORvUNQIyh1sGOYZQD9pBhXKJEodxKHGxUE=;
 b=CAsx/pDe1Wkrg53BpIfArfLGu0xTVtrX+k3qJEPElhL4clbL326g3ncxj8ff63Lshg
 DkPxSd60klfleBYFcK44tOaNZiXDe5RHTijn4H2+sDzx/k8totpXW+QYNX0kLj3ll/GT
 ImYxnbZwhbaWjRkLfjVkm0c/w9D4TMIwsph2UvgT58iwN6Cq47y/2gNJcD8i5SWrPHRB
 PAlIY6/1W23Y0twkj/l8PWc4t963TFHUUIRwsa5CO1L7NqY5T1K7VWFyU+6JYeJbsCO7
 WYqgnWfcURM1hJMONs44JemCkrrhix+vM0upJTqpu6voybMfPyvnMxV/VeDyONlwrlty
 CPAQ==
X-Gm-Message-State: AOAM531XB9pQEgCAWVJIcdNSy3EtNHARoMMFYCaARJ113ftBHq/fgGOR
 5v95xGNmAyeNt2YPthdIO6Qkpw==
X-Google-Smtp-Source: ABdhPJzxiu4+Dwy4IN/+uDif4C1jKhZe+OrFq076G7xg19pOJbsxiSm/zf1EhIGBd+IGBWHNbYNy3g==
X-Received: by 2002:a1c:1d12:: with SMTP id d18mr3381888wmd.121.1611648597861; 
 Tue, 26 Jan 2021 00:09:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:485d:4b34:2d87:12d5])
 by smtp.gmail.com with ESMTPSA id
 t25sm2061228wmj.39.2021.01.26.00.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 00:09:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] Revert "arm64: dts: amlogic: add missing ethernet reset ID"
Date: Tue, 26 Jan 2021 09:09:51 +0100
Message-Id: <20210126080951.2383740-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_030959_883512_4216614A 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SXQgaGFzIGJlZW4gcmVwb3J0ZWQgb24gSVJDIGFuZCBpbiBLZXJuZWxDSSBib290IHRlc3RzLCB0
aGlzIGNoYW5nZSBicmVha3MKaW50ZXJuYWwgUEhZIHN1cHBvcnQgb24gdGhlIEFtbG9naWMgRzEy
QS9TTTEgQmFzZWQgYm9hcmRzLgoKV2Ugc3VzcGVjdCB0aGUgYWRkZWQgc2lnbmFsIHRvIHJlc2V0
IG1vcmUgdGhhbiB0aGUgRXRoZXJuZXQgTUFDIGJ1dCBhbHNvCnRoZSBNRElPLyhSRylNSUkgbXV4
IHVzZWQgdG8gcmVkaXJlY3QgdGhlIE1BQyBzaWduYWxzIHRvIHRoZSBpbnRlcm5hbCBQSFkuCgpU
aGlzIHJldmVydHMgY29tbWl0IGYzMzYyZjBjMTgxNzRhMWYzMzRhNDE5YWI3ZDU2N2EzNmJkMWIz
ZjMgd2hpbGUgd2UgZmluZAphbmQgYWNjZXB0YWJsZSBzb2x1dGlvbiB0byBjbGVhbmx5IHJlc2V0
IHRoZSBFdGhlcm5ldCBNQUMuCgpSZXBvcnRlZC1ieTogQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBi
YXlsaWJyZS5jb20+CkFja2VkLWJ5OiBKw6lyw7RtZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20+Ci0tLQpIaSBLZXZpbiwKClRoaXMgaGFzIGJlZW4gcmVwb3J0ZWQgdG8gYWxzbyBicmVhayBv
biA1LjEwLCB3aGVuIHRoaXMgbGFuZHMgb24gNS4xMSwgSSdsbCBzZW5kIGFub3RoZXIKcGF0Y2gg
Zm9yIDUuMTAgYmVjYXVzZSBtZXNvbi1heGcuZHRzaSBuZWVkcyBhIGNvbmZsaWN0IHJlc29sdXRp
b24gb24gNS4xMS4KCkplcm9tZSBnYXZlIG1lIGhpcyBhY2sgb2ZmLWxpc3QuCgpOZWlsCgoKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSAgICAgICAgfCAyIC0tCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIHwgMiAtLQog
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kgICAgICAgICB8IDMgLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWF4Zy5kdHNpCmluZGV4IGJhMWM2ZGZkYzRiNi4uZDk0NWM4NGFiNjk3IDEw
MDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2kKKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpCkBAIC0yODAsOCAr
MjgwLDYgQEAgZXRobWFjOiBldGhlcm5ldEBmZjNmMDAwMCB7CiAJCQkJICAgICAgInRpbWluZy1h
ZGp1c3RtZW50IjsKIAkJCXJ4LWZpZm8tZGVwdGggPSA8NDA5Nj47CiAJCQl0eC1maWZvLWRlcHRo
ID0gPDIwNDg+OwotCQkJcmVzZXRzID0gPCZyZXNldCBSRVNFVF9FVEhFUk5FVD47Ci0JCQlyZXNl
dC1uYW1lcyA9ICJzdG1tYWNldGgiOwogCQkJcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX0FY
R19FVEhFUk5FVF9NRU1fSUQ+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpCmluZGV4
IDljOTBkNTYyYWRhMS4uODUxZWViNWU5ZGUxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKQEAgLTIyNCw4ICsyMjQsNiBAQCBldGht
YWM6IGV0aGVybmV0QGZmM2YwMDAwIHsKIAkJCQkgICAgICAidGltaW5nLWFkanVzdG1lbnQiOwog
CQkJcngtZmlmby1kZXB0aCA9IDw0MDk2PjsKIAkJCXR4LWZpZm8tZGVwdGggPSA8MjA0OD47Ci0J
CQlyZXNldHMgPSA8JnJlc2V0IFJFU0VUX0VUSEVSTkVUPjsKLQkJCXJlc2V0LW5hbWVzID0gInN0
bW1hY2V0aCI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQltZGlvMDogbWRpbyB7CmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCmluZGV4IDcyNmI5MWQzYTkw
NS4uMGVkZDEzNzE1MWY4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZ3guZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gu
ZHRzaQpAQCAtMTMsNyArMTMsNiBAQAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2lycS5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZXNvbi1neGJiLXBv
d2VyLmg+Ci0jaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1neGJiLXJl
c2V0Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdGhlcm1hbC90aGVybWFsLmg+CiAKIC8gewpA
QCAtNTc2LDggKzU3NSw2IEBAIGV0aG1hYzogZXRoZXJuZXRAYzk0MTAwMDAgewogCQkJaW50ZXJy
dXB0LW5hbWVzID0gIm1hY2lycSI7CiAJCQlyeC1maWZvLWRlcHRoID0gPDQwOTY+OwogCQkJdHgt
Zmlmby1kZXB0aCA9IDwyMDQ4PjsKLQkJCXJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfRVRIRVJORVQ+
OwotCQkJcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKIAkJCXBvd2VyLWRvbWFpbnMgPSA8JnB3
cmMgUFdSQ19HWEJCX0VUSEVSTkVUX01FTV9JRD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwog
CQl9OwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
