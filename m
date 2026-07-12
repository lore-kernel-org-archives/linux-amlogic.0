Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC66C43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQwBDBzoZ2lZsgLnuA8bw7IEl2A6miEsp88emZ//NF4=; b=bN6xfb4mBgU0aa
	eozU11zpIYP1yRbtjuvJ+LrCLNNa36tBVeCQlW+CsRGBVvSIAHFw5BOLMgVeeSR2RK5+wfuKUlxLK
	9w461rLIwjR9pPybNoGs15d0qJim3lq8uCIvLLXfinUkJjxB0EcGDAcQk144oZm9QqQQYP2U4WUy2
	gHYIjUKiSAKYpwq3haZk0BIqsBmKxEVLk2/md5rkSCQVnNiLKrd5VuHCs9k0N9X1q/Y6DHCPcOiGv
	bPcAXOTwzqlhGyBwl9n548uu/24X6Ia5gD3dC3VNIMe9a4faX+8AA9daQBRdZ9l+3We6yO2mF2lL4
	yiZFORFOhgk6peWXhpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu9p-00000007TJr-38Wj;
	Sun, 12 Jul 2026 13:23:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu9n-00000007TJ7-19ma
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 13:23:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c7c61b5292so40461635ad.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862622; cv=none;
        d=google.com; s=arc-20260327;
        b=fNS0nFdhKJzBdp7Aez3KJndRiQtwwirmWC8Ai7hlt+/GKTI2S9Lcg2FEFnvz2XH7Wq
         0hAvcEx4jSJQyxk/cXZAhzpeWph92cbl7SxF12FMIxIgE9kVXntO7jDHXjZYVEPQHIiv
         Up0njdAbU4NL/YxILe8irWqFGsWtx6GKAG97lAAIbGkly66JrRFrtkqENpyipI3rCt+O
         C7ydyK8pdROMgAVGNq8A56wSQY0diAEYWBvxNC1jivc9nc2LDwydA2ALKahLRnmvBHrk
         T04Vpw600uKdu0zyPV71x7ouT28Nj+dfnuuoQ4r/cQ2K93Qt9rFD7xfApZkHGMa9ieHL
         bB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        fh=TfittRnWqfUtDPXrRmNEcnvLCQ5/+7JWjJBg1QV+esE=;
        b=Kc4SIFcZed/DfYCWsZ0ddS/DeRtGOZ3TS66+aD1wNbB6DK2/pSRqGZR3Dld17XAZB1
         ACZCli4t2TGVRsSpBVpWNZeTRHXamaH6NpFNs9/HN4mNCgkocyBTy8wcGshsUTVHdI4F
         LOV3LnjdR/Q+9OwjAmKHvPsQDXfoaT9rxFcP487fwc2KD6DaUnJyTh0ImNmRGarjJo3h
         tj976C1XWxOUsne1ujyhD9AGBxsiXwRZPmCC/q8fQG7NPffxwjmUb4kEJLvy77Qe9tJ4
         htgvAoZ1vnHAbKi+pwXXMVFR6DpGNs8VE3gTDgOyecEy69sHx0TG1MX7dQJUdUZoHSrg
         ebWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862622; x=1784467422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=XkAQTJv5GIfTZKYcJMSH52ORy9zSFm964qfcc4m9Gkfq2zqE1JotAipjvV3nBpZVlN
         fw3YhV1ihuGrVDzVr1/LyBOK1fsRkBNS0LZrFOhrX/xDKto3V8JuSv1Qrc0FEItB/u3m
         TpLp5w2uqttzBalFKa29DF5VMTmuMBSgQrlQcoziuo3PSf2wJ9F1H87ELTIUtIhgeFTg
         /ryb5SSoZitT9D705OEvczysCJKqoi7/YRxsttObAWAF2fTHbbp/r/8A9msBW3Z3JEY8
         YERQHVWjikS/CWCNyFPMdudJdb7M2PwW+bLTGGzH+BxkJcHPjcMnfthn2Qt+AT9IGcds
         Kk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862622; x=1784467422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=DDxo4SqVYswHhisTjVmwB39IFZ8MdFzvHaaVwrir9UE7GY+kKDcyglK0J35GQc0fnh
         DL+39zrNQnYI+NdW/OLzkwpKdoXlgXsPCCLUArcKXPVcbzO5ypujVnpZhjq2UruqueyI
         8b+NpoLjfpmic+NPtNf1elekgtKEbm7xLFClOGj95nlVKkTv+0Dd3AnFZAkHjAlGb0MW
         XnrE5iS4oezRkylM2dIzYyNJcZjDrXyQ3QnD379tVVlfMtRGfhTYuGLLgeqRZSe/am+J
         gIPJtUpbil8tG0MQjYhoAXtUSEvOYcO2i474efuv+C//aDMWiTrLC8J79F7resQQzz0g
         IqTw==
X-Forwarded-Encrypted: i=1; AHgh+RopW6H/Yi3+1TUv4HnBR7W85JQJ0rqSUJllx9SxfZ9DDO547Z0wt6gSHeziC9Y/z23JHIyfxJ5w1U0inymU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt20gk6xZfftSiCy/PdVD4TGeQW/QCr9n9rbXRLBRSVbo7cQ/n
	0+Qw/OHKV9is7CPO2KiY6xXu+0OFNpmrDtf2XhTY48MmSug/yNxhAmgRk8L3geuQJBPowJMe4du
	Iyd7unKJvdQ0ZOce1SZb6Qm9EFTsAsMk=
X-Gm-Gg: AfdE7cmHCRhtP/h0gkeorFvQG0GwDkuJZsqvcOrpbupsjtXK4HZLW0mKKsOX5ARRcBp
	V1kupD8ICgPXmibaGhDGO6bBwneek4T0LUH730Dq7tXZFvo3BRun5jZaFuGgDkuIVYjbgHCMcei
	VJqWdBP4ebjaVYC0LR9wXQaA8A+klAcI+B+7c3nX//C03nJSJhkaRvvvYj2MIYsjvUjz5k1dmaN
	DH1xI0w6dacC9w0jVCexS0CippE6uf+FR1nSEd7Es16Mib0zbHp0A2o0quSqIq+GUM5XkUb1xNG
	FcCz9AyXkTcfPGGly54NYm6RekXX+g==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id
 d9443c01a7336-2ce9ec0f108mr56548535ad.24.1783862621987; Sun, 12 Jul 2026
 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
In-Reply-To: <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:23:30 +0200
X-Gm-Features: AUfX_mzypuSkZEBJ20fubf7QLH9Pq4J2Gq3FfCadOdbOn5XOHaqqRDGX3eTeNBA
Message-ID: <CAFBinCAMtch=GJO8mba9zCj9KT77AuDSpybcuH9_1gu1i=Hr2A@mail.gmail.com>
Subject: Re: [PATCH 6/7] media: meson-ir-tx: Ensure rc_free_device() is called
 on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_062343_314455_962A2ADD 
X-CRM114-Status: UNSURE (   6.62  )
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

T24gRnJpLCBKdWwgMTAsIDIwMjYgYXQgMTA6NTPigK9BTSBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mu
b3JnPiB3cm90ZToKPgo+IE1ha2UgcmNfZGV2IGRldm0gbWFuYWdlZC4KPgo+IEZpeGVzOiBkY2Nj
MGMzZGRmOGYgKCJtZWRpYTogcmM6IGZpeCByYWNlIGJldHdlZW4gdW5yZWdpc3RlciBhbmQgdXJi
L2lycSBjYWxsYmFja3MiKQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gWW91bmcgPHNlYW5AbWVzcy5v
cmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
