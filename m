Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8765CA9ECC
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eub2t7f9y+MT9kJqecmEfBq7KHABIrxSFcfQYdC/zic=; b=w1e+7Zw27tGaE7
	ciuYJPYTrTSGOzD4QTFhBcFI+QUzm5aP10tPkY77jtZmtrXMUMMrtXbzAzvev2jiPZufCc/ShseL8
	vENoAkBzWKWNzcUlwG5/AfVBJTwteVRLzSRC9P656IeF4ueUOx5ENRR/17j/F2tL/cF3Z/XEZyu5U
	+TvPi+kwrw8oAzlrC/NCSe2ZVLdiwFfIBWbf9xVW2hO5lQiR8kwLLK9dYuMnfj1hCE15aF34dlRtJ
	UnL56VKN5E9UvHyvtkFtszkeYRU28aLCxQ2IBPb0lWl0gXDjzh2aHc3K+dAp0oE5IKxkMliijBehv
	Ikodxmvrs+wVDvE+Ityw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Uo-00000009PAo-0WKP;
	Sun, 11 Oct 2026 20:50:14 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Um-00000009PAF-15t9
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 20:50:13 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67583c777abso1146709d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 13:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751811; cv=none;
        d=google.com; s=arc-20260327;
        b=hX9EP+iVgWNdnvRgEGQuKJgCgP8QVCAoLA+ztnQlfBcaUfv14tNjNM0jnKnGchVHab
         T8ldeTax3JVOY30L84KmRp7enSuhLgFYynyqnnBA9DFYC+GbL+YOKf6Ym8YVC5LpMTC0
         pFN8eYWPu4LtGZmCPheQBeoezgNsVvPjPJll4t/pkw57TLFjldLVu7Is96xOlt+wf4Cv
         j3ypDgCWL8hMvgkmQXOIEs/jAWAMZGc0bPygt689g7w1/oSPZbV2KxRFrCs7+vPWdwUt
         Mq88GfbTXzTW13Rw919tMwiJfH0ahMGv7V9tK2QvK5RRTWOmfJjiSJJgaegTRw28CX7s
         IKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        fh=Y88QWepQ/dILd3r5o0QWTfkObyyv+yrpOmIU21ReFt0=;
        b=Kx8lBr8xfzusygoPJ1GOtF6I+0M0Hn3rY6JS25M9HR4ekJDVWszSBI8AdcQMiLIILk
         vEzLXzlF6Dp4npNhqXeop3zt9xvZ65karTRW5euJ3jxjbGmFHCg4lMk1MO/yQhcbPTVD
         n3lzANAF0GUOwJnduridbVD52o0iU2nVdUctpQ88AeTQqcFaEcSzfwulJJz7eE+LZi9R
         GeK1LRrKWgB8bRhXCgERC1+arDRcNpJrY09f0d33klW4EChMbk46FITyKWbrt/h6Nzob
         Ra4yElZfou+Zb+vGM/pPWZoWNdnsFk63BdSyQJoz7ioO//GOYSK/MAh+t0p8CsHte5H1
         XwXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751811; x=1792356611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=Bq5cTdhCAW0nwTkmwNwdyNIonGixsxVYds2eTeGdQ2XxJW2Us7r7ki0uQpkLARrLsQ
         73w2gEaaQrqA2PE7K/4bgvuyipHDWWonovr/kyHWsxTxxrIWHsTCaCBiCPsne/Ox073e
         mtTRXQHxdz4blkf5hTNK6w5asjVYGKd6C65FkD71e5IYX1Aa0WynwKtm/BoEAsygEd5J
         EIQ9dYjSWr4dNdxN+lcq0XD6A3RZJKZaGH+a19ZML04NnUmBCrBcKWhk48lqRaNbQ92u
         1DY0Fopwm4v7QtGegoxLEN/ABEUjOAIL5XXHb2Ivu5AYWJWVgibUmdU0wktNo7qKU6+R
         gdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751811; x=1792356611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=zmrgGsKfco/1JL6sGT5/dvvFecsbaDhdujImUosH9lfWKrRRFBu+4WIcfOHNbDFVKI
         isO5K8HbmRbBYR2HGzDq0s7ZzjVs/ICip6qzdYC9oyNrntmmXuHJLLlqfD0e8RmZdgoX
         R6izu2JMGWyzmgW8mDRoHG5vvxFLj5irpGJrOC6BOUvE9oMce5/ets4lYZqZRonyht9c
         +zW7WfOoLCOWXunCB6ocwvjvS5ov1j+QqoY+3yNxFfdp+1q7hht80bSj4rXWhfk0Kayo
         ecuQZza+Q/baVzTgmtmmbKiAqYEeG3UdYBAxgcPMC8qy42K3uXki0xI/JZYUgq464Kul
         kTfw==
X-Forwarded-Encrypted: i=1; AKwUvBwC8TVqJH7jfGFd9pGaqYL+wBtbTyeDXFEd0hdaVziGp0sHC/xt7eE6huWUXm+HNLWULxCTCV6sNzgjJx+q@lists.infradead.org
X-Gm-Message-State: AFq9FYJrMsT7dNTAgMEq6ru/rCHtBh/bB1nGInDe2Il0cZJkW1ExQTMQ
	y7HaTVVys3QKmaSlPGNEM9sQiBKqjjTawK99mrr/thRWnAZcjH/hYXaVIK3sWethmg0ylr2r76c
	oHjgHxOZXJjgb2SmrMjPWockTBQBcGTg=
X-Gm-Gg: AYBFou185R7nslRMM8XGZ3pkGJpNGVppH1aOnnfvrLM7fNxNi1fvmvz5oFgW5gOZLFo
	GBRo0ANKcBRHdc3dWDJO9nGDX6uPOb36vRdXxLeMis2q82zm5LFKZYcvGJf2OGXL8q5L7LTt+pn
	WzaErUb5ECAgv0/28B+9FejdQSzgZgBUGM8ceZNw9AArYq2itmjKp2R7hDT49H0nrSxvgabI4OZ
	/jLWVF5ZEvrK5F2WoS1eCqNpojkeoKaPO4pn4AkzihMJ//5cxkcra9I5X5IsUUjcuTR8CoKMXTl
	9ot7M73E//btGMLftZseOnL9zq5LdWX0EZ6qyMa2kOhiU+4LSg/VH3QfaaleMPPS6Ovsn3fzs1y
	n3LZDoANMLZNx
X-Received: by 2002:a05:690e:144a:b0:672:bd30:83bd with SMTP id
 956f58d0204a3-679369c2fbdmr2874224d50.49.1791751810698; Sun, 11 Oct 2026
 13:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:49:59 +0200
X-Gm-Features: AclHuK_PzKBu8m_ohCyUp7PhTYe_NgQTHs4WyLsmyGpLktVRlcmdBIs7NzTNljY
Message-ID: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_135012_313564_BC86F913 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

VGhhbmsgeW91IGZvciB5b3VyIHBhdGNoIQoKT24gU3VuLCBPY3QgMTEsIDIwMjYgYXQgODozMeKA
r1BNIEZpbCBEdW5za3kgdmlhIEI0IFJlbGF5CjxkZXZudWxsK2ZpbGlwcC5kdW5za3kuZ21haWwu
Y29tQGtlcm5lbC5vcmc+IHdyb3RlOgpbLi4uXQo+ICsmZXRoX21hYyB7Cj4gKyAgICAgICByZWcg
PSA8MHgzNCAweDY+Owo+ICt9OwpRdWVzdGlvbiB0byBOZWlsOiBzaG91bGQgdGhlIGV0aF9tYWMg
bm9kZSBiZSBtb3ZlZCBmcm9tIG1lc29uLWd4LmR0c2kKdG8gbWVzb24tZ3hiYi1vZHJvaWRjMi5k
dHM/Ck9kcm9pZC1DMiB3b3VsZCBiZSB0aGUgb25seSBib2FyZCB1c2luZyBpdCBhbmQgdS1ib290
IHNlZW1zIHRvIGRlcml2ZQpNQUMgZnJvbSBTb0MgY2hpcCBJRC9zZXJpYWwgbnVtYmVyIGluc3Rl
YWQgb2YgcmVhZGluZyBpdCBmcm9tIGVGdXNlCihzbyBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIHN0
YXR1cyBvZiBNQUMgYWRkcmVzcyBpbiBlRnVzZSBvbiBtb3N0CmJvYXJkcykuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
