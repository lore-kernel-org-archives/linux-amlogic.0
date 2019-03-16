Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DCDC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A262218FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6ySUTfN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OsIybtZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A262218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXpW4YS+bI1kqKGkLJa6lPEtZwoAmLn9R+mOkgqye4U=; b=W6ySUTfN7Hh7Mh
	rB/bcROwtYqbq3QodwxBoXYIXo+kiLJmCAxaxcKTc4b8R3ui7H3mjJcFhETXdabSo4YXTCB3NIDyh
	5KZJogOM2bINIZIJhCMst2H5A+VadYo1cKztNio34Mz8ztA1tQCuOP39O2hBdR1411GjXUhyrhaGb
	kE57nHjI5tgzHV+vPLdcGH8OmWfHKukibgwq7QQggZzKgpLUawycCVkLvyrdksJ6Zf49LF59lNlv0
	7fvlHodvbG1AU6G2ODkJr0nfwyLxL7GrvnLsynVNIKVMQ4LKfWvxUGlpqgEicsZFD04RgVAB0HAff
	Bs8erLUsGemRlVOSkNpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AZk-0004g8-FZ; Sat, 16 Mar 2019 14:46:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AZa-0004XO-VT
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:46:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id 81so1324310wme.0
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=Izjb63p2HaZHE2clhxW4ay43O6ayzT6ddHaT/zcyC7c=;
 b=OsIybtZMBcL7eYxdwtGFMGNBhu4cr1O7cYqznis4qPkmMFMC2xRg1jvqEmm6yWZ+uY
 nDgR7OJ39MXFEurGxjbZ0yKD9poRTld1q9ynZuz64h11V1x9e8ueJFVsncwm9RdC+rvg
 VS7MTypVdk8fAp3sSL2WSkgpTZ+NtEZLo6oKS5ONLbC4EB7/8tDbVG6BOTIDa4aM8I8h
 HoN6aIKXx+Xkw3UntrDT4RS6+zmAXA5AMp5BKFrnl0TpkeB4IC3QbqPuImryxCN/3y1i
 K+Dsl2hY9dpJNaZ6bC/GkGpL/tykqvjjGjJ0CwJo74+cQQEqKOAV1lILL+wPDHtkzQxm
 0POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=Izjb63p2HaZHE2clhxW4ay43O6ayzT6ddHaT/zcyC7c=;
 b=RnvmZsdFQDao7azCK5jC7S0JCAYGlc6vgL+vVqZ9RdNej42nor7TYcwImdtk3v4Xkp
 2lzc1H5P/jcTj778GhYeyH2xXHeQA4k/CwMX8ZhASvDNumgxBrvKoFQjhxXIYkV9nRe7
 M306QJX54CHWlTT4BAwu8kcUtJZTyLMy5N3gYFm0fnqEl2BmmPkm4aRIyTcbSg1MjBJy
 YEITgXEXuOqogtmaKLuZ7Yt7kxhFaa1ekjcs3Dg4G6ozuHzqp6YQWDpLkJuXskNuzB7E
 9kosKllymUjhpa24YIdv00d+ImJLGZefFEMvCSjTB9p/+FCvschByTW2/LiQjOrbVxi+
 w5Fw==
X-Gm-Message-State: APjAAAXPNTjSdsoWOsb4pALbqsKNbM+boOVkFORmmEaTVPoEwPKmLKRZ
 tAk1Q4MZpBwzrfGxwEGqc5b0Ix5J3Qqkrw==
X-Google-Smtp-Source: APXvYqwDrshQotCuqfmaQZ7frmkLcdbe6cviivQMvCvYvo4PmYA6LU27kHMd22RNxp+EsSMRic+iLg==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr5639549wmh.53.1552747565340; 
 Sat, 16 Mar 2019 07:46:05 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 u14sm4991785wrr.42.2019.03.16.07.46.04
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:46:04 -0700 (PDT)
Message-ID: <5C8D0C2B.2010605@baylibre.com>
Date: Sat, 16 Mar 2019 15:46:03 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-12-narmstrong@baylibre.com>
 <CAFBinCDU_6JEJJS8yZkq0rjbqKcy2eBKFaYqgX3txGMiO5U9Fg@mail.gmail.com>
In-Reply-To: <CAFBinCDU_6JEJJS8yZkq0rjbqKcy2eBKFaYqgX3txGMiO5U9Fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_074607_065094_1190C039 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIyOjUwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsLAo+IAo+IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDEwOjU4IEFNIE5laWwgQXJtc3Ry
b25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4gKyZkd2MyIHsK
Pj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+IHlvdXIgcGF0Y2ggZGVzY3JpcHRp
b24gc3RhdGVzIHRoYXQgdGhpcyBlbmFibGVzIHRoZSAiVVNCIGhvc3QgcG9ydHMiCj4gYnV0IGR3
YzIgaXMgb25seSB1c2VkIGZvciBwZXJpcGhlcmFsIG1vZGUgKG1lYW5pbmc6IGRyX21vZGUgPQo+
ICJwZXJpcGhlcmFsIiBvciBkcl9tb2RlID0gIm90ZyIpLgo+IGRvIHdlIHN0aWxsIG5lZWQgdG8g
ZW5hYmxlIGR3YzIgaW4gYSBob3N0LW9ubHkgY29uZmlndXJhdGlvbj8KCkRXQzIgaXMgcGVyaXBo
ZXJhbC1vbmx5LCBidXQgd2UgY2FuIHN0aWxsIG1hbnVhbGx5IHN3aXRjaCBvbmUgb2YgdGhlCnBv
cnRzIGFuZCB1c2UgaXQgYXMgcGVyaXBoZXJhbCB3aXRoIGEgVHlwZS1BIHRvIFR5cGUtQSBjYWJs
ZSwgdGh1cwplbmFibGluZyBkd2MyLgoKSWYgdGhlIE9URyBjYXBhYmxlIFBIWXMgd2FzIGJlaGlu
ZCBhbiBVU0IgSHViIG9yIGRpcmVjdGx5IGNvbm5lY3RlZCB0bwphIGRldmljZSwgd2UgY291bGQg
ZGlzYWJsZSBkd2MyLCBidXQgZm9yIG5vdyB0aGlzIHBvcnQgaXMgYWx3YXlzIHRpZWQKdG8gYSBw
aHlzaWNhbCBUeXBlLUEgb3IgbWljcm8tVVNCIGNvbm5lY3Rvci4KCk1heWJlIGl0IHdvdWxkIGJl
IHNhbmUgdG8gYWx3YXlzIGVuYWJsZSBkd2MyLCBhbmQgZGlzYWJsZSBpdCBmb3Igc3BlY2lmaWMK
Ym9hcmRzIG9ubHkuCgpOZWlsCgo+IAo+IAo+IFJlZ2FyZHMKPiBNYXJ0aW4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
