Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161FEE9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7H3hLgFV8UbJFIVyz6I5zpxTokcZJu0o6gHMI7Af9M=; b=Z1FndX1QcqNo9S
	AVb8leI0mx3Kg2p1avD6JCgRVIV98e3ziBGSCvMX3YMYXHxjkGSqtHdWwJzjQ3SEdCX/Fj0kyz/ER
	T++zHfqwsWI498XUJgPHyp89lc9xP74IqeDiffUmAdsrCOoqW5XK+CaSq++NkpadpPRwlEhBINNJv
	W4i6jGYmFMTHBkxWXa7fhbN3GLW4Zbuue5InXf/oIuJjDG0Golb7yqQp0U+JUYiAkG9xlKuJ6B3DV
	OELYkpLHSWEHi006N5h6CtNmn+HxtJYf2ZVYkXtXEN8xVWZt3wsvKvF5IsAKdwi/c79WBOVRtfQKv
	NGCNSHUXONW2RbL4oBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnDd-0000000AJKP-1L9w;
	Wed, 18 Feb 2026 19:28:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnDa-0000000AJJs-0ELu
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 19:28:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso1543665e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771442892; x=1772047692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FCYIJj0Xz3DNfT5NA4cBOMj1BDhbRNIp0uYNdaHJvk=;
        b=rOjYV+n9WU4yI/c1b4XAqRLw4rQxtS6aE1eSn2LUe8NHfnx/Xc1g23cCU6MK1CWsq1
         wbdwBf4G3zNWgRayIgCEZKWAFHrkwWPA72KVUJBz8h1uvSlwCbXl6fd3xE6JIsewhiZ0
         0wwdKFuM94QHrMW2U9w8sqqwX4kdTduYvO/p7E7m0x2udR3aZbi9MDJYhK3qnpEjM4Gf
         JWBprK5QlmMi8NMvynHZisYTuckxaS4ZqgaIDvVbW18fvR+CnszXMQHP8G8R/aJOXhbJ
         uW+ZU9c8Il376mfjs4A3VWEGL9YUyEpITRhToLlApEIX/f0VabhRC9fzRCjeWMqTScLp
         GajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771442892; x=1772047692;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FCYIJj0Xz3DNfT5NA4cBOMj1BDhbRNIp0uYNdaHJvk=;
        b=V2Q0SCE1ROLhbfClju458RzIkYthMdDAWnrDh3S0KSH87XaymOhT4lzh9jTq57sIVD
         AwZcjiNzG9erYFDvFbxKUhvOovyLwJ8jaDUs48cElgyip+OqGYnw8DymAlfrs9m1mi2h
         46ewRi1hfOZBQIHh7SebcKp2X4EMpicSHHWODWQZS8RgiUQzDkDvT4X9NGCFNr7JtSOj
         GQL0ZVGQHYNK0TW0ToIcPDxUhNM9x6ipE8CeF6a+J2BIXToULsyA9Q+IUVTwjC3pA7yI
         5irgu8FNuCPxjPnZps4T6+cRCCg5fZ6V/xTZzsdDLPosuumLYtpEz1F/vb07LB4JSDA7
         e0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp204GO63jzTb8mrMEIFuw6jgAOamrkSbz9f3LGmeZ9ka9Vq2pWlmfYlN6wPMsnN1TIUc+esDBzA759nk1@lists.infradead.org
X-Gm-Message-State: AOJu0YxNtJ5hUeFp8zjnGQqiAMYankKjYeGs+5VAe+M3HHiyS71nd868
	fapDvGLDJdbxnVJN8tSa+QPwJwYc3/edCJG2WBhFHZ0ns0yHHJFYM9Smezj1yV1WTg4=
X-Gm-Gg: AZuq6aLDeh3uZs8NdfiElZ6i62G/KHcyulSPgjmrG2DY0QpvdMnEu9z86Ae5KfEtRvn
	J2i6MRjxqKcew/6D2vPuv4JC6Ry4u/CBObpggXyUiCTLMjGItXT/IMM91oCUuf1E36nIBoUZAfA
	ysAtZ+0Qw2l61vNtuo1znfV5GdMsCAGv0UD97yw1PjzQpSvc2PAN3bGlf70EShbYnldadEjroSS
	QX3n6TM21L5d0QHWglnWIyQpdh6KGnUEQ6KVzag5YOjjWEpLEf+eV1NTuN7qYPWdp+XF0MkvgyV
	Ynjsr5/zZO15165XFepN3TOQz39jkAGTs1aN4mYFuebLV2XedQ/98a41kkNR1VmXCB1ZoSPNH75
	HKw6QDQ34+R57f/h/4ZxdGbTfIFy9JkIEaR0OinrISDsdU9/Q6pRF4b9aYxcJXGG7blmWHYo2Zb
	kn0KNR6yt5X+LQsyaDWteYMA==
X-Received: by 2002:a05:600c:3b13:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48398af1ef9mr53949695e9.37.1771442891970;
        Wed, 18 Feb 2026 11:28:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4839e7f9d1asm818125e9.3.2026.02.18.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:28:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
  linux-amlogic@lists.infradead.org,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org> (Krzysztof
	Kozlowski's message of "Wed, 18 Feb 2026 20:17:53 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105611.36216-1-linux-kernel-dev@aliel.fr>
	<594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 20:28:10 +0100
Message-ID: <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_112814_364224_23A014FF 
X-CRM114-Status: GOOD (  12.95  )
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

T24gbWVyLiAxOCBmw6l2ci4gMjAyNiBhdCAyMDoxNywgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gMTgvMDIvMjAyNiAxMTo1NiwgUm9uYWxkIENsYXZl
YXUgd3JvdGU6Cj4+IEFkZCBQTEwgZm9yIHRoZSBjbG9jayBjb250cm9sbGVyIG9mIHRoZSBBbWxv
Z2ljIFQ3IFNvQyBmYW1pbHkuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8
bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4gLS0tCj4+ICBpbmNsdWRlL2R0LWJpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MuaCB8IDE2ICsrKysrKysrKysrKysrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBTbyB5b3UgaWdub3JlZCBteSBjb21t
ZW50cz8KPgo+IEFuZCB0aGF0J3MgdjIsIG5vdCB2MS4gWW91IHNlbnQgdjEgYW5kIEdPVCB0aGUg
Y29tbWVudHMuCgpJIHRoaW5rIHRoaXMgd2FzIHN0aWxsIHYxIGFuZCBpZiB5b3UgbG9vayBhdCB0
aW1lc3RhbXBzLCBQYXRjaCAxIHdhcyBzZW50CmJlZm9yZSB5b3VyIGZpcnN0IHJlcGx5LCB0aGVu
IHRoZXJlIGlzIGxvdCBvZiB0aW1lIGJldHdlZW4gdGhlIGRpZmZlcmVudApwYXRjaGVzIC0gcHJv
YmFibHkgZG9uZSBtYW51YWxseSAgLi4uIGF0IHBhdGNoIDYgKHRoZSBvbmUgeW91J3ZlCmNvbW1l
bnRlZCBmaXN0KSB3YXMgc2VudCB0d2ljZS4KCkkgdGhpbmsgdGhlcmUgaXMgbm8gbWFsaWNlIGhl
cmUsIGp1c3QgZmlyc3QgdGltZSBjb250cmlidXRpb24gd2l0aCBhIGZldwptaXN0YWtlcyA7KQoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBs
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCi0tIApKZXJvbWUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
