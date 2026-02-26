Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9715FD9E0A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpWehYTXUI4I78m2rHGbe4sW8d3hWXloFHMp1wkoao0=; b=bDclC/yz/TP1zD
	179ZkIWi9xgEbA8Id3z3Ct3liCx4xYdI4KwTYchvQ8mXQEfNbEmM6UKaivQF8dFyJQogesJD3+FPk
	hLVYpp2Hd37bFcoqj5PqyuNNsDyQ+8oaEprhAUfg+i57ULF8HyePt1t9y7+KgW5ouZwCpxuS8tQi0
	rKEMYkE2LO4YbkY8bap8bKUWHDlwvvBU/gvlyiOQ4C4NBErPv/1akCwoyYv2mai1TI+5n075qCuZK
	V1/8p/K1Aw4P/ZWYgUsySfAy9PCLf+EmpKogg7ORABZt1solSixb5FHurmovXK2q3imSlY2Q046rp
	Fyz9V5XicDXYdIXDaYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviuK-00000007FBP-47Yq;
	Thu, 26 Feb 2026 21:28:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviuG-00000007FAm-1lcS
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:28:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ad9516a653so6122145ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141303; cv=none;
        d=google.com; s=arc-20240605;
        b=kHjo30GtP42yXI/PxdZsTCcrYV2tyjmqwgVl34bGZF3YuuJwDCbUcOGLcy7I5cKroU
         I4d9YCWQsXyKd/ffk185TKhaL8HxXUuLxZqBxY3aUv4hh9ZImRjq1JKfoVwe5DnUI64/
         Zf9surJMKx0nPyDXTB21EfNnwPhiQtKaTsto/RYEBkUvpLd/wojYfgIZRLDKgb7/MZJr
         awwiNl7w1A2eqIAsY6f9aUR3QwdXXSb05w6ljoJXkDPeRznR+pDuajxCdzDJ4HXduTtA
         Yh8HrWLH9l5sYcuciYucVOdfRu4U2ZBY2PeVs4oMjLX8qLFQG1OlHFolCO2dqaYDq4At
         ZkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        fh=vBK1zDGVbnSkRRCdkjuGTYFGYB2wGLPAEgRxlSTFtdE=;
        b=XbWCrHfDQ9TMH7mfQX1kcq4w7dQ55eIostk0lOUZ9oGJLqI4fKbXBDN4xr5qcILV5E
         ceqC9IkVcUUV2Xaf/DfEFwSpw6faDZwY6w1cGSkQg3Jib6lE/XTSJs/yRPCdipKklNWC
         k65J+556DOdcNH0bvDYQbK3MCGrQD/KCCOsq+MlmermNSw6DdetGXFR4EqcBSlbU+98f
         UaJON57OBp7+qjGP3xu/o85VLjFb9NEzOcf4rFPKgpd48JoWtrllaPO3g3RMMlUDqiiE
         taCxFV39fDDLHoHOxyt+gdCWC0fSaTM+GzTBhLm0KfoeeN5CtkuYfg32OI21Ab+UG76p
         +heQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141303; x=1772746103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        b=GDEmP4tDHNI0AFbVPdfwbhtRPPXcQSvSYwUUUCNe2pQUumccmvVV88+ErpTr+x9jS9
         b7AqWOmZNWUBUj0xY/B2oJD2yS+dRvfE2xKFOodq/eRck52LPwxFjWUJO5kmCLH5ZYtQ
         WuXWfYIze1cOZQI5jjrKeU64fnsEENZ6ewn5NwSweYtLSu+tsj3bqjq32o1Ct0N+fUlg
         l0xf9DDIKJMsPUXehVbDmePcyZtjfNeF3/QhwF1G/U61iwQ7Op4QP3xow9VSN17wZm/e
         MHIdHUBntcrcKPFNHgjNDjd61B/5Jjt2HL5UGnAP94bD3r0A4ne9++hnyR/ubVsUBv3l
         NiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141303; x=1772746103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        b=JfhnKPCfsG5I7G0vSaKA3ehpw8QjWUcncuZ+nnQ+L089qRaqURUDIp3nkxekCoCDGo
         71ApMOPljNy6YfBVVxsKJbMJtirOpsYcy5qAJdv2+8ekF81zZIBz7hFlbXP/mGsRoIto
         9VTF9HgX06ijBlWPATDxE+9UpiymHFwsX8CW84LbbVCPulJgN8dI7uWckwO2dIEy791k
         hWrcypWKZ3eILRIOL1sZvoQh9z+LCe8gaRpn4qlSgIguTN5/lj/uRKZwEGebzn2sMhxk
         Ci9KIy7s985xUwmyWX/ajj4IFTw/Q46R9QeYrC9dHxh84PAHVdMbdQ9micZQFoByRFgx
         sY7w==
X-Forwarded-Encrypted: i=1; AJvYcCVK8WaNkZAwwj4ap17D46gNhmkYvtpIYvfxTdUbL/1n8DaI/xEWgt1JyZR+VOz1Q8joWFeMeB10HHR+SJn7@lists.infradead.org
X-Gm-Message-State: AOJu0Yym4h3Kzp1aTgVJGTaxTIibqzW/+KApJLbh5e4X4fLGrjsFE2lT
	qX2mXNEk+BJLewOMlg1U8Tqsa6vuoYUyygXsaSwRaLfBiAq2tewVVcTUCO3lDV/lMVdBGpzSNnG
	BYkX9NWRXXz8r8uOEosd9PP0Y5KEkKHA=
X-Gm-Gg: ATEYQzzxzyV0I12yituRxvOruUlbyVcYVy7HWQaR9oqxn1wn92ybEQwn2YMcD86uaqV
	MVVw28BngrFxE655g04XcxdS1un23XTTKIICwo9JqSjEUPsI6nOi6x9PMXoVdrPoGThnl/sQBBD
	uGxLuyLOXP+U+sB0NLTFLX0LFh/earMTyCamdX9GtCGRZSfjyimUvhfFFGZRy7romJtjIFAd3cf
	CFpviNI8EZUgXUqkCiypIx57ibFXZdRVTUC/6DIA4jlHI4EMRM+86n2p4Bwu13XU38QmYfxh0a0
	tpMXt5QFS6VAIx5xOUZLhX43rQLe62u18TrAldyv
X-Received: by 2002:a17:902:ea11:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2ae2e4da14fmr3619915ad.53.1772141303480; Thu, 26 Feb 2026
 13:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-3-nick@khadas.com>
In-Reply-To: <20260123022258.136448-3-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:28:12 +0100
X-Gm-Features: AaiRm53fDnetE2FB5uKh_jYrb87ycfZGsGZSe-1f1i-ud__7mbll8f8_BcLdpWg
Message-ID: <CAFBinCB4R6nui+6uwcQAzPFyqA38rZGEvYwGgPHKbjysQyWLMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable bluetooth
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132824_482957_EBE024DD 
X-CRM114-Status: UNSURE (   9.57  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMzoyM+KAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gVGhlIEtoYWRhcyBWSU0xUyBib2FyZCB1c2VzIHRoZSBBbXBhayBBUDYy
NTYgV2ktRmkvQmx1ZXRvb3RoIG1vZHVsZS4KPiBUaGUgQmx1ZXRvb3RoIGNvbnRyb2xsZXIgaXMg
Y29ubmVjdGVkIHZpYSBVQVJUX0EgYW5kIHJlcXVpcmVzIHRoZQo+IGV4dGVybmFsIDMyayBjbG9j
ayAoTFBPKS4KPgo+IEVuYWJsZSB0aGUgVUFSVF9BIG5vZGUgYW5kIGFkZCB0aGUgYmx1ZXRvb3Ro
IGNoaWxkIG5vZGUgdG8gc3VwcG9ydCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxu
aWNrQGtoYWRhcy5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKWW91IGNhbiBrZWVwIG15IFJldmlld2VkLWJ5
IHdoZW4gdXBkYXRpbmcgdGhpcyBwYXRjaCB0byBpbmNsdWRlIHRoZQpwaW5jdHJsIHByb3BlcnRp
ZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
