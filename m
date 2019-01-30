Return-Path: <SRS0=1mM9=QG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C2EC282D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 09:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01DD62082C
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jan 2019 09:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAvSzEkO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RFHHbNsP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01DD62082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EY2joab6T7L1hC25VK5o7O6RliprhtlPx7ulXDqneLw=; b=IAvSzEkOH1VOMq
	xPSGA98wtdBxFdavS0ROxoMKlB8JFR+fCgf86wET4uFLG9Apz659v3k5c/P+NAQx726fFIbBF9xpW
	7bZ3fK7qgteISjQL8FMXedXN3BfoteT2Oy1OXSo+hAiQi69y4PNtl0m2mQkL18qw3tfSgd1EfJEQ3
	Vkhr9S1xd6bD6dsvKF7FSJL69U10velrZ0ZKF1lLUN3hdAh/iQPlyGnK9BK8Spnei9dak4T6mQTJe
	ZiUGJcXY/MW+5yznOSAAw+yg8nKpa1jDGjEo1FqK2XBzfILBTZSSJnuyhfsg5r1R8+kssyGl6CKtd
	gVSuOG06Bx/3v4WB1WzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gomYZ-0003Jq-Te; Wed, 30 Jan 2019 09:53:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gomYW-0003JK-Cw
 for linux-amlogic@lists.infradead.org; Wed, 30 Jan 2019 09:53:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id l9so25216866wrt.13
 for <linux-amlogic@lists.infradead.org>; Wed, 30 Jan 2019 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaYUYldqP2jiiRgWiA6/KkBfuQPiUHZR5J7jgi2PgdM=;
 b=RFHHbNsPVVFZYNsYBu3mX4ksz06irgV/ndlYbHFVFxDr01+tB6mouSn4tneWqlHhyR
 At7XBIIT1qyc6CESESU6FRqIgHshP7V5A1UVcd1edGZ1Y/zG48NTFt5MwWyphDn+GTLe
 fIQUyNQ6rXVQxWbLhUqN6cyhZIIohXSRUJfEnMgdqTBdLCtInfNOVha4W497kfVXlMSl
 ep+u3FrCP5aQXCVXNeFgKo3aog5TKJXr3SeI+l3hicZQ1IeB9onKfSDr8DyOiDYUU+DV
 jk9fRmmSJ9ltgbpfc8aKgpRq1BP1yRrnTPeQP7zsLSM03vmrCrLyj9+1BPCSeZ/E5dvH
 WTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaYUYldqP2jiiRgWiA6/KkBfuQPiUHZR5J7jgi2PgdM=;
 b=kgv4schPhiFRi8smQ77kf8/aEKUYh848/APWuXYWrlrg6vqwu+oJT5lnLpOpmyOoum
 7Vujf6+4+cmt8O4t4FgZh9ucijmm/A1os/DGyYaLOjKlgBVIKIoXGoP6uwVQRlKZAvNP
 0zZHvEshtRGPiYUbTMzsWTgDlMy+6W3o9UeTurWN3tcXeDGMNwpE6izExlNYkshCzbQ/
 LFz+Ik2NXNr7VgoTnAKRqMlG/HY7SiB7v4qQbaQxmkSMZxQyszC57qg9ohzus08hPXHT
 f5QXLCsiL9Wjg6RYz9RGhYyaqs9F4dRzJWhurI7IFX1dWwfWxZwQ82ddZz16JQlDpRdl
 ZPIg==
X-Gm-Message-State: AJcUukecWoce2J+JIwWFPjnnuPOQfl4bUiR/EQrCRbdeyr4St65kC//f
 IGuKWi6v3KSLESpNNRwqIi6Inj58Ep8VRw==
X-Google-Smtp-Source: ALg8bN6fmcan1mK6/x+Ii1AQ10QnxrUAx2dKZmnlJgqKvEFXw/YFypjRZhf5qbIuCowLGALTnJPMWA==
X-Received: by 2002:a05:6000:120a:: with SMTP id
 e10mr29627518wrx.85.1548841994505; 
 Wed, 30 Jan 2019 01:53:14 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 126sm1074293wmd.1.2019.01.30.01.53.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 30 Jan 2019 01:53:13 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: u-boot@lists.denx.de
Subject: [PATCH u-boot] MAINTAINERS: Add Amlogic entry
Date: Wed, 30 Jan 2019 10:53:10 +0100
Message-Id: <20190130095310.8803-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_015316_436155_8F8F0578 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QWRkIGVudHJ5IGZvciBBbWxvZ2ljIFNvQyBtYWludGFpbmVkIGZpbGVzIGFuZCB0aGUgZnJlc2hs
eQpjcmVhdGVkIG1haWxpbmctbGlzdC4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpOb3RpY2UgZm9y
IG1lbWJlcnMgb2YgbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QsIEkgd2lsbCBzdG9wIENDCnRo
aXMgbGlzdCBhbmQgQ0MgdGhlIG5ldyB1LWJvb3QtYW1sb2dpY0Bncm91cHMuaW8gZGVkaWNhdGVk
IGZvcgpVLUJvb3QgZGV2ZWxvcG1lbnQuCllvdSBjYW4gc3Vic2NyaWJlIGF0IGh0dHBzOi8vZ3Jv
dXBzLmlvL2cvdS1ib290LWFtbG9naWMKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCmluZGV4IDMzZjExMjdlNTAuLjVlZWQxNmQyZjUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlO
RVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC05MSw2ICs5MSwyOCBAQCBTOglNYWludGFpbnRlZAog
VDoJZ2l0IGdpdDovL2dpdC5kZW54LmRlL3UtYm9vdC1zb2NmcGdhLmdpdAogRjoJYXJjaC9hcm0v
bWFjaC1zb2NmcGdhLwogCitBUk0gQU1MT0dJQyBTT0MgU1VQUE9SVAorTToJTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgorUzoJTWFpbnRhaW5lZAorTDoJdS1ib290LWFt
bG9naWNAZ3JvdXBzLmlvCitUOglnaXQgZ2l0Oi8vZ2l0LmRlbnguZGUvdS1ib290LWFtbG9naWMu
Z2l0CitGOglhcmNoL2FybS9tYWNoLW1lc29uLworRjoJYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJj
aC1tZXNvbi8KK0Y6CWRyaXZlcnMvY2xrL2Nsa19tZXNvbioKK0Y6CWRyaXZlcnMvc2VyaWFsL3Nl
cmlhbF9tZXNvbi5jCitGOglkcml2ZXJzL3Jlc2V0L3Jlc2V0LW1lc29uLmMKK0Y6CWRyaXZlcnMv
aTJjL21lc29uX2kyYy5jCitGOglkcml2ZXJzL25ldC9waHkvbWVzb24tZ3hsLmMKK0Y6CWRyaXZl
cnMvYWRjL21lc29uLXNhcmFkYy5jCitGOglkcml2ZXJzL3BoeS9tZXNvbioKK0Y6CWRyaXZlcnMv
bW1jL21lc29uX2d4X21tYy5jCitGOglkcml2ZXJzL3NwaS9tZXNvbl9zcGlmYy5jCitGOglkcml2
ZXJzL3BpbmN0cmwvbWVzb24vCitGOglkcml2ZXJzL3Bvd2VyL2RvbWFpbi9tZXNvbi1neC1wd3Jj
LXZwdS5jCitGOglkcml2ZXJzL3ZpZGVvL21lc29uLworRjoJaW5jbHVkZS9jb25maWdzL21lc29u
NjQuaAorTjoJbWVzb24KKwogQVJNIEFUTUVMIEFUOTEKIE06CUFuZHJlYXMgQmllw59tYW5uIDxh
bmRyZWFzQGJpZXNzbWFubi5vcmc+CiBTOglNYWludGFpbmVkCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
