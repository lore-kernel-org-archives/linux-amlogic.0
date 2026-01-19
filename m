Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FECAD2ECF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WM6knW2T3t+etyPRizni89u1cCaa7UcwUFZ5bdchbRA=; b=mwJEbkaaSbqr+U
	Ism/mv2Y763gevhZQ/ErhPwdmg7zrv6IgDijPyWWVCFMxR9LQB0xe2UpGV5ex9aQtecsCTWVRkg29
	k4odxhANA7S3Y1XE4FeIkTUi6eVsGCCj6/7g2KqhzzhAyFbvYe2JJZXaST7I9ZZZWbsn3enn7qGlj
	Rt9/RmJBXgBVHcm4bfAloqLi1LnBrUI1diUpIRXKtaKJXwbhJYxH7ihWAwsGshwUOyopyrZSI2qzC
	3JEWKYT4YbhdMebYZKwoR1YNJY7LYd03YRXRoEip0olUlaYw3v1XZ2ouRd6Cd0rkzc66ghb6/Mv5f
	ib7E8xxT5s2uY+Ec8BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwyr-00000002uUX-0SHh;
	Mon, 19 Jan 2026 21:40:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwyj-00000002uTI-4AIY
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 21:40:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a110548cdeso31214445ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 13:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858805; cv=none;
        d=google.com; s=arc-20240605;
        b=lB1zCwmVR5/m9bmoMP84hcADzKwao5C7OZgu+Bf2EoSXoUSQNNLDlJFFCNLRXP4p6i
         JkBXN6BQXJpWSmo6SQlxpSkWqEpYot/64ieX3v3EQyswiOOV9/ptwB+FqFAz4B2XPSA0
         KNw2e96EndlTrQRRseeEPeWvDfB/nJzG9aREhDkpRm1SSSE/fXH+EwPgvDSN9Wpk7EG+
         DK5QGGNlgZcbkz11eaG0/R1z9LSMVTdWcqF4yitT3qCudrxAcXryNYNvpi2LfIk5ptDX
         qJvtdjZYy44leEIAk4Xdt9yMe4uUeMhUW+Y3/F3/ngmtbCiCj5ppolEOT5VOTbQqyoM1
         pmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        fh=mZ5AwgiLPyzYIpd1S5NgV78JhMV8eQNcyixQhcU5r+c=;
        b=kfqBG9mO5mF/6N3W2YwfxiDyeBgkgs/pZwoLvlITnpx21k4CMx6mV1tb62nXpGsncZ
         qS25epXVjhxRfBRGlnMV1FYlRPgoD6VG8cC2jbs9FB/streQ9eZ37//T9ImwiriS/kTg
         8Z2otiDwCuxLRaq5CF+4JvlP/dMmT+oUb1sswVdGSmEfm2psm8OHNB3c1hrJehCo1JS4
         CC5YlLW5crUNslsKZRWhfeh3zRuHu6uNt2Su85j1X9+zIh27iOd7fb7LM6QoVlzBGn18
         RxxSAO2Q+Q4RifCW+G6LJ1tlMyD6yYBqPOLUDy116L7y5yyejMQ/Yp1fQsUsFv7EgSyr
         a1aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858805; x=1769463605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        b=iq68Tc01Mvo/r7pFJyjQT2xX7H3f7FzueKVQ9wEskg7jSTdZx4EcivLojGHqSeTvlj
         cmCS2qoCaWStp0k2iwahQFdtQiuispjoQAE4ztNzHbPn3KV7Egg5xSsdyFw2zzi+GQnM
         Y4XCKQkxza4CBZnhf45oW797Slo18d427xaQ/id6BmaAt1LNwHWj0kEm9qDQch7z+yf7
         n2KrTVc1Ra/rbCaU7wUZlK+iNv/X5JaqZDl0Qp4KkYyGumn7aOdsSjTkTQBfId503zgr
         IgZCBgYwXtojP1r4Hc3VkGMGME56tM4t7J7NiPUlMPp7tvHRmOFs7+o2bPGqz1WIDndu
         f9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858805; x=1769463605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        b=Ws3pA5h+Y6T9WghhdLlX2nEBWAL/B5ZkG/L+eSeU1ffOa858VvwOCnagAtN8866eR9
         xi2F+YXt4No2ITNtNu8OmNTBknmjZxyVWY86suFzHOe9+VDTjXmzbFOP/6FZZUO29wvK
         3Ufbth9qI5G4HiYPcTkNOJZ1Pj62AxQ5VhkHc9xNOIApm9WJZ0SA6xmqWtndTHMzGHwc
         dcN2jjSVL03uyfHpcHiJ94NqcOaKl4NpOTrP8gC8UNCOzODeB42LcmqFLlzHLWk9d5LD
         8m2+j83hiclGEbXeKK+ZTapjFfJavDtS5J1UqzK4LggO5X3Y0IVTKilUmqOGiPkSB5nq
         Z++g==
X-Forwarded-Encrypted: i=1; AJvYcCWtN/MpTsvwg3UQlpVP+5emmclxNuYP7cEdDEvy/YwCddNwjAPBeV9RS3Ym1t73hnn5iY0Xrpnt9VFjhr1R@lists.infradead.org
X-Gm-Message-State: AOJu0YzTJ8FR2VtnpV1UDmC4Dmc336rvcW8FK3LU+9DJyeeXukIDuB93
	uropZY1z207hbEh4qnr0lriTUH9t2h5dCvrjYqMrudBOT3i27yfK428I29Mb+MocLJiVMwJCgSx
	c79MV5eyEEWYgJkvWruKZbm2nz9nWEzo=
X-Gm-Gg: AZuq6aI59DzZiLspC5EhDemQjETk/SGYscUNzvzyC/eodW+3+kM7zjuqZQG4VXpzDtW
	d4ysXEbuAKF4yyhOuJDZKnsfrzs8DyjSJx3QGRppShdniONORc+0bf2D7oguJnwVGx2+LrGdLKo
	aAnu+lz8wY/B2FlVsaBwC8Np6BjnNwRXlH2uVAt+RlqiHRIUYjAoZkKAnmqg980lT0QUsL7oZMe
	aNVvAM5Q9oKz2YMPAiAi4V6Yj2B0e6gAUFXtk5+kkcai93+Mrr/PHuuQdMqNALI+KNHdlpxnMCS
	FBGztuEh6fNLa/fdgYFPKVFJaiyn
X-Received: by 2002:a17:903:40ca:b0:295:290d:4afa with SMTP id
 d9443c01a7336-2a71753755cmr110427715ad.23.1768858804795; Mon, 19 Jan 2026
 13:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20260116023900.2036657-1-nick@khadas.com>
In-Reply-To: <20260116023900.2036657-1-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:39:53 +0100
X-Gm-Features: AZwV_Qgat7I5RJwyS0qYSlAnRBAN4jc1vt4piOLxALOTFSnVgB2ZAhHU5wXVsak
Message-ID: <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134006_056221_64659678 
X-CRM114-Status: UNSURE (   9.16  )
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

SGkgTmljaywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaGVzIC0gaXQncyBncmVhdCB0byBzZWUgS2hh
ZGFzIFZJTTFTIHN1cHBvcnQKZ3Jvd2luZyB1cHN0cmVhbSA6LSkKCk9uIEZyaSwgSmFuIDE2LCAy
MDI2IGF0IDM6MznigK9BTSBOaWNrIFhpZSA8bmlja0BraGFkYXMuY29tPiB3cm90ZToKWy4uLl0K
PiArJnNkaW8gewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICsgICAgICAgcGluY3RybC0w
ID0gPCZzZGlvX3BpbnM+Owo+ICsgICAgICAgcGluY3RybC0xID0gPCZzZGlvX2Nsa19nYXRlX3Bp
bnM+Owo+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgImNsay1nYXRlIjsKPiAr
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
Cj4gKyAgICAgICBidXMtd2lkdGggPSA8ND47Cj4gKyAgICAgICBjYXAtc2QtaGlnaHNwZWVkOwo+
ICsgICAgICAgc2QtdWhzLXNkcjUwOwo+ICsgICAgICAgc2QtdWhzLXNkcjEwNDsKPiArICAgICAg
IG1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+ICsgICAgICAgbm9uLXJlbW92YWJsZTsKPiAr
ICAgICAgIGRpc2FibGUtd3A7Cj4gKwo+ICsgICAgICAgYW1sb2dpYyxkcmFtLWFjY2Vzcy1xdWly
azsKSGF2ZSB5b3UgdHJpZWQgd2l0aG91dCB0aGlzIHByb3BlcnR5PyBUbyBteSBrbm93bGVkZ2Ug
b25seSBlYXJseSBHMTJBCmFuZCBHMTJCIFNvQ3MgcmVxdWlyZWQgdGhpcy4KVGhlIG1vZGUgZW5h
YmxlZCBieSB0aGlzIHByb3BlcnR5IGxpbWl0cyB0aGUgU0RJTyB0aHJvdWdocHV0LiBTbyBpdApz
aG91bGQgb25seSBiZSB1c2VkIGlmIHRoZSBzaWxpY29uIHJlcXVpcmVzIHRoaXMuCgo+ICsgICAg
ICAgbm8tc2Q7Cj4gKyAgICAgICBuby1tbWM7Cj4gKyAgICAgICBtbWMtcHdyc2VxID0gPCZzZGlv
X3B3cnNlcT47Cj4gKyAgICAgICB2bW1jLXN1cHBseSA9IDwmdmRkYW9fM3YzPjsKPiArICAgICAg
IHZxbW1jLXN1cHBseSA9IDwmdmRkaW9fYW8xdjg+OwpJJ20gbWlzc2luZzoKICBjbG9ja3MgPSA8
JnNkaW9fMzJrPjsKICBjbG9jay1uYW1lcyA9ICJscG8iOwoKPiArICAgICAgIGJyY21mOiB3aWZp
QDEgewo+ICsgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gKyAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYnJjbSxiY200MzI5LWZtYWMiOwpJcyBBUDYyNTYgdXNpbmcgYSBiY200MzQ1NiBj
aGlwPyBJZiBzbyB0aGVuIHRoaXMgc2hvdWxkIGJlIChhY2NvcmRpbmcKdG8gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC93aXJlbGVzcy9icmNtLGJjbTQzMjktZm1hYy55YW1s
KToKICAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzNDU2LWZtYWMiLCAiYnJjbSxiY200MzI5LWZt
YWMiOwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
