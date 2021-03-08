Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D0EC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:23:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F026C651EE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F026C651EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nMhx7UKdy5ZwWCAYTx5FMHieb/+a8hMiawchhESXOgE=; b=T2CDz7oceTjt0XVKT2Xki0O0k1
	0gdfwcQvdmhoDAgTFmNwzZ7vFEdlF0FgqTS0Lb9AWMMN0fvA4Qd0qyQrIWZfyl7Ujgmo0VWk6eM7p
	/1MCoGhL/F3KvSotgucCsQjn4ZXQmfJUmK+2HjTv6ttn0/ARkfnyIR+4UF9TD+7w5mKeXeXoTVDKg
	pdd8D3YmpNHYCK9OyV0JCczyYxndaThVXFbXb9G8WSG5qxOqNYmOMI/hPzqhhXhyuSHDQJ9uKfFUx
	ShZM8+R51XFawTW1suowKll2Hs/i4b32MOIu18d+iZmFEo2EGQY4ub/i4eCAjiWKnMjDg2o8oxX0T
	87lrr+eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJC6U-00GALC-JV; Mon, 08 Mar 2021 09:23:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJC6Q-00GAJx-Hz
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 09:23:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b18so10633427wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 01:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f64vzvUYp/6BIz2bYRDqXZcELW1TUj1vEHLZdr8FG/k=;
 b=0UV6grLle2JlyxB+vpGpxgFbYU0LPkv6t4Em4wd9KxppTar9HyPhGVFyjdh0X/1CeC
 yVM1j5hmq3BpE+J7hhF9nJz/vtBD4DUSU++ltZqVF2GzKyJbob5VZCtFotSy2KV0Im32
 0rEJWixBIRAg3tiDipdgt2UZCpbh4aJev6rXAUmhGSJyVts2MZ4zLAMuqfHad2YmDnO+
 GNhjgE9bbkpqYWqzcPqoV1Jq2/g2/AnEinoAVFDr6z/ouRtY2ze+WT331xVkyAOld3G4
 rOEHi2bw871/hMMwei2C84aalcY/MLwqpKtdrJcJ3tbmJgOFxfEFpgEkpYeyZfcU3jhp
 iOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f64vzvUYp/6BIz2bYRDqXZcELW1TUj1vEHLZdr8FG/k=;
 b=Fd4j4e7uuAqtCjz9vfnh1bsLnQBl2OEgyb6qPVcUH9MBDqgShXhMy5hpkQJqKiOG8C
 3pdd9xCY+hlf6lXnOGaFAo+F5/GVXDSH3SsOPIiIwGIYPhUjUOudikIY8rVl5OmdCqVL
 Vj7yd4+jZHE2TWzvs0QCLsKqPJ3eBw8064YUxhcbf4xBjtcdzFhqgHqDQgPJAiNqxmHz
 RfDDZckuoua8ERnBG8+Z+LXztrCDdjKXGtClczP4azYTH9W8XoDFxHjSyJs+A2aEXF5y
 6QUqs/H7O6dZaKFj0HE3CqhRlw8jvAUn5peOi3GLNGkDwqzYBmo0l6dZxTCe4nQEv3uY
 kZhw==
X-Gm-Message-State: AOAM532SINjm6/2qle9eNnTZkUpf9pOqI77KBOC6myLLB/lX9ZLhvAmc
 e+JV5W0lE8zWZqY8+gFy90RITw==
X-Google-Smtp-Source: ABdhPJxO61PIGnoxcBeQJyEnYhOvEWnAdYMi1tSgdINEd2Cfr9brs/PTheL2dopelRb2FfdPi77nCw==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr22548425wrt.111.1615195381875; 
 Mon, 08 Mar 2021 01:23:01 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:5985:2622:fd0e:9316])
 by smtp.gmail.com with ESMTPSA id
 9sm15888113wmf.13.2021.03.08.01.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:23:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: stable@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH stable 5.10] Revert "arm64: dts: amlogic: add missing ethernet
 reset ID"
Date: Mon,  8 Mar 2021 10:22:41 +0100
Message-Id: <20210308092241.17058-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_092302_910800_94B57886 
X-CRM114-Status: GOOD (  10.69  )
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

SXQgaGFzIGJlZW4gcmVwb3J0ZWQgb24gSVJDIGFuZCBpbiBLZXJuZWxDSSBib290IHRlc3RzLCB0
aGlzIGNoYW5nZSBicmVha3MKaW50ZXJuYWwgUEhZIHN1cHBvcnQgb24gdGhlIEFtbG9naWMgRzEy
QS9TTTEgQmFzZWQgYm9hcmRzLgoKV2Ugc3VzcGVjdCB0aGUgYWRkZWQgc2lnbmFsIHRvIHJlc2V0
IG1vcmUgdGhhbiB0aGUgRXRoZXJuZXQgTUFDIGJ1dCBhbHNvCnRoZSBNRElPLyhSRylNSUkgbXV4
IHVzZWQgdG8gcmVkaXJlY3QgdGhlIE1BQyBzaWduYWxzIHRvIHRoZSBpbnRlcm5hbCBQSFkuCgpU
aGlzIHJldmVydHMgY29tbWl0IGYzMzYyZjBjMTgxNzRhMWYzMzRhNDE5YWI3ZDU2N2EzNmJkMWIz
ZjMgd2hpbGUgd2UgZmluZAphbmQgYWNjZXB0YWJsZSBzb2x1dGlvbiB0byBjbGVhbmx5IHJlc2V0
IHRoZSBFdGhlcm5ldCBNQUMuCgpjb21taXQgMTlmNmZlOTc2YTYxZjlhZmMyODliMDYyYjdlZjY3
Zjk5YjcyZTdiOSB1cHN0cmVhbS4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNS4xMC54
ClJlcG9ydGVkLWJ5OiBDb3JlbnRpbiBMYWJiZSA8Y2xhYmJlQGJheWxpYnJlLmNvbT4KQWNrZWQt
Ynk6IErDqXLDtG1lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6
IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTog
S2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIxMDEyNjA4MDk1MS4yMzgzNzQwLTEtbmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2kgICAgICAg
IHwgMiAtLQogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRz
aSB8IDIgLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpICAgICAg
ICAgfCAzIC0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaQppbmRleCA3MjRlZTE3OWIzMTYuLmZhZTQ4
ZWZhZTgzZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4
Zy5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaQpA
QCAtMjI3LDggKzIyNyw2IEBAIGV0aG1hYzogZXRoZXJuZXRAZmYzZjAwMDAgewogCQkJCSAgICAg
ICJ0aW1pbmctYWRqdXN0bWVudCI7CiAJCQlyeC1maWZvLWRlcHRoID0gPDQwOTY+OwogCQkJdHgt
Zmlmby1kZXB0aCA9IDwyMDQ4PjsKLQkJCXJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfRVRIRVJORVQ+
OwotCQkJcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CiAJCX07CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
MTItY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNv
bW1vbi5kdHNpCmluZGV4IGE2MTI3MDAyNTczYi4uOTU5YjI5OTM0NGU1IDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKQEAgLTIyNCw4
ICsyMjQsNiBAQCBldGhtYWM6IGV0aGVybmV0QGZmM2YwMDAwIHsKIAkJCQkgICAgICAidGltaW5n
LWFkanVzdG1lbnQiOwogCQkJcngtZmlmby1kZXB0aCA9IDw0MDk2PjsKIAkJCXR4LWZpZm8tZGVw
dGggPSA8MjA0OD47Ci0JCQlyZXNldHMgPSA8JnJlc2V0IFJFU0VUX0VUSEVSTkVUPjsKLQkJCXJl
c2V0LW5hbWVzID0gInN0bW1hY2V0aCI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQlt
ZGlvMDogbWRpbyB7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tZ3guZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCmlu
ZGV4IDcyNmI5MWQzYTkwNS4uMGVkZDEzNzE1MWY4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZ3guZHRzaQpAQCAtMTMsNyArMTMsNiBAQAogI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dl
ci9tZXNvbi1neGJiLXBvd2VyLmg+Ci0jaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dp
YyxtZXNvbi1neGJiLXJlc2V0Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdGhlcm1hbC90aGVy
bWFsLmg+CiAKIC8gewpAQCAtNTc2LDggKzU3NSw2IEBAIGV0aG1hYzogZXRoZXJuZXRAYzk0MTAw
MDAgewogCQkJaW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7CiAJCQlyeC1maWZvLWRlcHRoID0g
PDQwOTY+OwogCQkJdHgtZmlmby1kZXB0aCA9IDwyMDQ4PjsKLQkJCXJlc2V0cyA9IDwmcmVzZXQg
UkVTRVRfRVRIRVJORVQ+OwotCQkJcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKIAkJCXBvd2Vy
LWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19HWEJCX0VUSEVSTkVUX01FTV9JRD47CiAJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwogCQl9OwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
