Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C65C43327
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3tN4+EIMn+kaa969p94bJmmb3VMjpPsU80OTLLYUR4w=; b=SwNPwZwIsZDlfi
	iD3nveuEE0YDXt8zQZ/gyGaGPeVWTSG84ndZAceOKUwCDs060imNiNyz/ADZynXX0nwlg3abkyZLv
	ItmZ2FC06sPvWd3+aW2ERwaiG3SPHAJzSZJfYcQBP3pnYCN6y3OHaTPyDwArJEkxOxkdsJ5MBFY3M
	eCrPHSoEgFS0pfA7o43tTO6SZtL1Pk3LPnIvqhUFqHo7O1cWZVPFpKYJHC5w81yUGRWmxRlE/igy6
	7c1VHu458JNF+ytroRoGJu1OJFElowx2kFbwqhdx7tzB5C6H2DhfOc77zONplALMQ4IlxnKd7UOhz
	FFOTHduOBsOONf1csy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMh7-0000000CD7l-1I9T;
	Sat, 27 Jun 2026 06:39:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMh5-0000000CD6l-15Cn
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 06:39:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4633193af19so876977f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542348; x=1783147148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=LDdRtFlZIW0aF025uZP8jv/xzuCrnNaQIFC8IxTGQk4SFNFYalogYleorsWBG0GuMA
         RZG9C259HZPG3FfkGTuW2BBaaYQhSdGLrDhawuyClynnPipxM3Zo2Zsxa1wFLDdkHX7p
         sM/nJL8UmgAh/fADMIUpV1uvHL8Zwuc3OWjCI2smK5hVcCaIYhPRLFSzO+5Z4Jvk2sCW
         37ijPmIVGKsP1XUwpnmLlSzA5bDPeOWoi6kGnKoPJpLvRcdq5oLn8PIkZAFaVfRNrq44
         mM7hEMz58BiLJ0cNHupP6ODsT5XBqinSXV2JI0oFqkJD9Qs4R0fYuz8JzZvrlmCUgW/X
         m5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542348; x=1783147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=RyzymUVIDXNl9gMsCCZ2PmMhJL5NssYaRKUn+KWnJ53qSm2aNDJCGGqKpVDKEyaNOD
         1++QkcDnqkysY9H4r80mm/ZGgBXMuBil4q6eZLv2GZOb/kcAceOZ0WCJtA4Zknsrb95e
         U9i3o995nRUYvPQ+VVbhmmqIsHStvV5xceMJghTuvvmQF93XtPK2xJ7Sg4IC3GP3VQEd
         tm7kc65w8ZqiBY9hMC2q8Ij+ynMpQ7eRMre4r4mv5DfqGwZ4SBTTqXcHh4jr41zs7RwK
         XIgbhn4EFMjU6t+6YKuaNFXsLfBwz+SP3uhdKeZE2u0dpgVKDNFM1hd1c5CX7pCJVwOQ
         XzBg==
X-Forwarded-Encrypted: i=1; AHgh+Rrxw9fV/70VCH20Ij1CQ0j3kHgOjAqx+Gn8TPQrXu2Dp0jAezPKg4o373wtYmmNco/AA5xXQXy2XN8SG8x5@lists.infradead.org
X-Gm-Message-State: AOJu0YzXybEFyL+kC5tUq0DN2e+QfaNb0aWDJ0r7LCpyNEtPwCa5sXjr
	kjcqRRnqDP3o8RYJvODKMmwDovUrIYGw1m3lZTU6nFKIOEHHNtXRVXW/CLmxYoTN0GQT
X-Gm-Gg: AfdE7cmxeZ/zLOjFphCM67axt5yfItuKa0vrtj6Q+i68BptR2XYiLZ3D/UDfB64RDCv
	2gBj4AytOr8gu9mVSUi4MkmdQNVBmIHIjZOfLaX7YH7LrNqOJrBrvoXsGeIReCrL5+ZBc+y7xxw
	XUoTrp9XEwuEqVkImSjPPDEMMUnA3tCxmlGfdJqIIteYnyZJ8I3DkXZh6SwhvRIKCN5PNOW1V7Y
	uP1j31+jDQPejiLR1jzXX1eRlbG0qLLe6/O6SHJ8zws+uzyx6GACV+te8H6mW1JlOYwGgTbTurp
	k8rrdRzgtVSWURTEyKAg/smPff9RAwOeksVqPFnxrGK+1srGjGiYMZELzKuPmQAjcVS86TPMUU4
	qweQd8yAqj1zuWv56WefR61wHQMVDhc29wPThreaZLXJ5A9zBqmSAt7X2RcLal9nT7nRy0CSavM
	UH8jtPq5B+Lf14J6LivyceSQicyx3XFfn/7Xaeh+3/V8yHIts0/GS0CLHVOWxZzOm5AYE5BiOxo
	0DEvw89abkaR5Dek9MVpDVBX9e+WZUfaus=
X-Received: by 2002:a5d:67cb:0:b0:46e:64f3:ee74 with SMTP id ffacd0b85a97d-46fb94541e4mr4577099f8f.45.1782542348074;
        Fri, 26 Jun 2026 23:39:08 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c22c680fasm31551666f8f.34.2026.06.26.23.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:07 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of in-use frames in codec_vp9_rm_noshow_frame()
Date: Sat, 27 Jun 2026 08:39:05 +0200
Message-ID: <20260627063905.79363-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_233911_321941_3100BDB5 
X-CRM114-Status: GOOD (  10.20  )
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

Y29kZWNfdnA5X3JtX25vc2hvd19mcmFtZSgpIGZyZWVzIHRoZSBmaXJzdCBub24tc2hvd24gcmVm
ZXJlbmNlIGZyYW1lIG9uCnJlZl9mcmFtZXNfbGlzdCB3aXRob3V0IGV4Y2x1ZGluZyBmcmFtZXMg
dGhhdCBhcmUgc3RpbGwgaW4gdXNlLiBXaGVuIHRoZQpwcmV2aW91c2x5IGRlY29kZWQgZnJhbWUg
d2FzIGEgbm9uLXNob3cgKGFsdC1yZWYpIGZyYW1lIGFuZCB0aGUgY3VycmVudApmcmFtZSBpcyBh
IG5vbi1zaG93IGludGVyIGZyYW1lLCB0aGUgZnJlZWQgb2JqZWN0IGlzIHRoZSBvbmUKdnA5LT5w
cmV2X2ZyYW1lIHN0aWxsIHBvaW50cyB0bzsgY29kZWNfdnA5X3NldF9tcHJlZF9tdigpIHRoZW4K
ZGVyZWZlcmVuY2VzIHRoZSBzdGFsZSBwb2ludGVyICh1c2VfcHJldl9mcmFtZV9tdnMgYW5kCmNv
ZGVjX3ZwOV9nZXRfZnJhbWVfbXZfcGFkZHIoKSksIGEgdXNlLWFmdGVyLWZyZWUuIEZyZWVpbmcg
YSBmcmFtZSB0aGF0CmlzIHN0aWxsIGFuIGFjdGl2ZSByZWZlcmVuY2UgKGNvZGVjX3ZwOV9pc19y
ZWYoKSkgb3IgdGhlIGN1cnJlbnQgZnJhbWUKaGFzIHRoZSBzYW1lIGluLXVzZS10aGVuLWZyZWUg
c2hhcGUgYW5kIGFkZGl0aW9uYWxseSBkZXN5bmNzIHRoZQpyZWZlcmVuY2UgYm9va2tlZXBpbmcg
aW4gY29kZWNfdnA5X3N5bmNfcmVmKCkuCgpUaGUgc2libGluZyBjbGVhbnVwIGNvZGVjX3ZwOV9z
aG93X2ZyYW1lKCkgYWxyZWFkeSBndWFyZHMgZXhhY3RseSB0aGVzZQpjYXNlcyBiZWZvcmUgZnJl
ZWluZzoKCglpZiAoY29kZWNfdnA5X2lzX3JlZih2cDksIHRtcCkgfHwgdG1wID09IHZwOS0+cHJl
dl9mcmFtZSkKCQljb250aW51ZTsKCnJtX25vc2hvd19mcmFtZSgpIHNpbXBseSBvbWl0cyB0aGUg
c2FtZSBjaGVjay4gQWRkIGl0LCBhbHNvIHNraXBwaW5nCmN1cl9mcmFtZSwgc28gYm90aCBjbGVh
bnVwIHBhdGhzIGFncmVlIG9uIHdoaWNoIGZyYW1lcyBhcmUgc2FmZSB0byBmcmVlLgoKVGhlIGZp
ZWxkcyB0aGF0IGRyaXZlIHRoaXMgcGF0aCAoc2hvd19mcmFtZSwgZnJhbWVfdHlwZSwgaW50cmFf
b25seSkgYXJlCnBhcnNlZCBmcm9tIHRoZSBWUDkgYml0c3RyZWFtLCBzbyBhIGNyYWZ0ZWQgc3Ry
ZWFtIGZlZCB0byB0aGUgc3RhdGVsZXNzCmRlY29kZXIgY2FuIHRyaWdnZXIgdGhlIGZyZWUtdGhl
bi11c2UuCgpGb3VuZCBieSAwc2VjJ3MgYXV0b25vbW91cyB2dWxuZXJhYmlsaXR5IGFuYWx5c2lz
IChodHRwczovLzBzZWMuYWkpLgpGb3VuZCBieSBzdGF0aWMgYW5hbHlzaXM7IG5vdCB5ZXQgcnVu
dGltZS1yZXByb2R1Y2VkIChBbWxvZ2ljIE1lc29uCmhhcmR3YXJlIHJlcXVpcmVkKS4KCkZpeGVz
OiAwMGM0MzA4OGFhNjggKCJtZWRpYTogbWVzb246IHZkZWM6IGFkZCBWUDkgZGVjb2RlciBzdXBw
b3J0IikKU2lnbmVkLW9mZi1ieTogRG9ydWsgVGFuIE96dHVyayA8ZG9ydWtAMHNlYy5haT4KLS0t
CnYyOiBQZXIgRGFuIENhcnBlbnRlcidzIHJldmlldywgYWxzbyBza2lwIGFjdGl2ZSByZWZlcmVu
Y2UgZnJhbWVzCiAgICAoY29kZWNfdnA5X2lzX3JlZigpKSBhbmQgY3VyX2ZyYW1lLCBtYXRjaGlu
ZyBjb2RlY192cDlfc2hvd19mcmFtZSgpCiAgICBleGFjdGx5IOKAlCBmcmVlaW5nIGFuIGluLXVz
ZSBhbHRyZWYvcmVmZXJlbmNlIGZyYW1lIGhlcmUgYWxzbyBjYXVzZWQgYQogICAgY29kZWNfdnA5
X3N5bmNfcmVmKCkgZGVzeW5jLCBub3QganVzdCB0aGUgcHJldl9mcmFtZSBVQUYuCgogZHJpdmVy
cy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvY29kZWNfdnA5LmMgfCAxNCArKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy9jb2RlY192cDkuYyBiL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9tZXNvbi92ZGVjL2NvZGVjX3ZwOS5jCmluZGV4IDhlODBlY2Y4NDE5My4uZGFkNzU5NTA5
MzNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy9jb2RlY192
cDkuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy9jb2RlY192cDkuYwpA
QCAtMTIzOCw2ICsxMjM4LDggQEAgc3RhdGljIHZvaWQgY29kZWNfdnA5X3Nob3dfZXhpc3Rpbmdf
ZnJhbWUoc3RydWN0IGNvZGVjX3ZwOSAqdnA5KQogCXByX2RlYnVnKCJzaG93aW5nIGZyYW1lICV1
XG4iLCBwYXJhbS0+cC5mcmFtZV90b19zaG93X2lkeCk7CiB9CiAKK3N0YXRpYyBib29sIGNvZGVj
X3ZwOV9pc19yZWYoc3RydWN0IGNvZGVjX3ZwOSAqdnA5LCBzdHJ1Y3QgdnA5X2ZyYW1lICpmcmFt
ZSk7CisKIHN0YXRpYyB2b2lkIGNvZGVjX3ZwOV9ybV9ub3Nob3dfZnJhbWUoc3RydWN0IGFtdmRl
Y19zZXNzaW9uICpzZXNzKQogewogCXN0cnVjdCBjb2RlY192cDkgKnZwOSA9IHNlc3MtPnByaXY7
CkBAIC0xMjQ3LDYgKzEyNDksMTggQEAgc3RhdGljIHZvaWQgY29kZWNfdnA5X3JtX25vc2hvd19m
cmFtZShzdHJ1Y3QgYW12ZGVjX3Nlc3Npb24gKnNlc3MpCiAJCWlmICh0bXAtPnNob3cpCiAJCQlj
b250aW51ZTsKIAorCQkvKgorCQkgKiBNaXJyb3IgY29kZWNfdnA5X3Nob3dfZnJhbWUoKTogbmV2
ZXIgZnJlZSBhbiBhY3RpdmUKKwkJICogcmVmZXJlbmNlIGZyYW1lLCB0aGUgcHJldmlvdXNseSBk
ZWNvZGVkIGZyYW1lLCBvciB0aGUKKwkJICogY3VycmVudCBmcmFtZSBoZXJlLiBwcmV2X2ZyYW1l
IGlzIHN0aWxsIGRlcmVmZXJlbmNlZCBieSB0aGUKKwkJICogTVYgcHJlZGljdG9yIGluIGNvZGVj
X3ZwOV9zZXRfbXByZWRfbXYoKSwgYW5kIGZyZWVpbmcgYW4KKwkJICogaW4tdXNlIGFsdHJlZi9y
ZWZlcmVuY2UgYWxzbyBkZXN5bmNzIGNvZGVjX3ZwOV9zeW5jX3JlZigpOworCQkgKiBlaXRoZXIg
aXMgYSB1c2UtYWZ0ZXItZnJlZSBvZiBhbiBpbi11c2UgZnJhbWUuCisJCSAqLworCQlpZiAoY29k
ZWNfdnA5X2lzX3JlZih2cDksIHRtcCkgfHwgdG1wID09IHZwOS0+cHJldl9mcmFtZSB8fAorCQkg
ICAgdG1wID09IHZwOS0+Y3VyX2ZyYW1lKQorCQkJY29udGludWU7CisKIAkJcHJfZGVidWcoInJt
IG5vc2hvdzogJXVcbiIsIHRtcC0+aW5kZXgpOwogCQl2NGwyX20ybV9idWZfcXVldWUoc2Vzcy0+
bTJtX2N0eCwgdG1wLT52YnVmKTsKIAkJbGlzdF9kZWwoJnRtcC0+bGlzdCk7Ci0tIAoyLjUzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
