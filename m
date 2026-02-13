Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4D0EDF152
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3aldLR9kwv1+X6ZWR3aMW9QyRgyivHQL6SDiB59yV4=; b=LWZKgSNthgaEhA
	OaZf+9LiacoenAfmyaNFvASOBywwADihEelXDXRB+x6TVxshhyhgqq0n5KW5ZD5D2AuFCYnByvs1x
	u70+bAj2LjTIIeD8rT/UhlsFXF6IXJ+VTgGqypO9HIkYvuLhXoyw7Yk0z8YtYNPG8hFdD5OWETl7d
	YYkcVc4u9h0h37xufR23PumwYIsRDvF8lPEVnwH5gO6JJ5MysYILiwV2zWVUoR5duYSGdpmEYmvIc
	yMTq1YjxQb20CWpGOZO4rgX2Ug6SVIqnozJiBkEGHJqVlRSpUXWvtwZHU8QAvlypSbYVJANg7IY5w
	XKaFB2Kmm/dhvTvjnDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr8X-00000003O0e-0OiY;
	Fri, 13 Feb 2026 11:15:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr8U-00000003NyV-0e7C
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Feb 2026 11:15:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b8f86167d39so94155466b.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Feb 2026 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770981296; x=1771586096; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=gd31OtO3XA64VTYceeuLU3UPkpuFVCXuWSH5pCX4s9/3pM8l2asYxQWZuZ9msCJB86
         HrkZgIz52cb3IkcpZRJchsflDSpXY1JKjVl6okb2uCf1Bqx2ZRaJEfmye8f/VLHB57mn
         wo1KJb69mGMo44BvtwU6zHyfaaR1ktsYLXvHizzKttTV/8qgzK53HLydxL0R4nO6f5rz
         wbca81pOOxQsYwitN7ctgBEGHUmuub9pOvTcVtRiwsZ/7vzuIhWrPy+7+YFVW/GuA8Cl
         xNM30eKPfq6fbAicS6z4H8WNLU+jm+8d8BzzwmUyqXUQD7uwEZlo3MRsZST8q+8ZRhqz
         7Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770981296; x=1771586096;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=RH/CXS6QCEgieHEL1GYBa3NKZYE4bxHb2EBdsDFWBZ+VgaBnswLH5G1YVWJ7y1ISWN
         J1oBlWSmzg37+8BoZ1lzuYreJpSIlrR8PZ96zOLfGhxt//gft3qV7PofJYYLlU+ldOrI
         bK3eEvnSSTCOXw3t/Q2NInRO3iwbpc1dVAsyEzsnGHO2C3ml/YD/BU2CZu68lQMNc00H
         nUxucdHa+nGrQbI3FS9oolssB9/OfIjjPDLn7pWksuNl5rH9EpfQAWqbo+6sCGSYicWm
         fGtabg3hZMqoSu2Q2pqO6TNMjTHBiFgRmIgkpk/sws0Dat2+aMwBu7jln7PN9MMBVOhw
         0TpA==
X-Forwarded-Encrypted: i=1; AJvYcCV7dZH5FVCbYTYR7kWTrjpdAMXuayNkmpXXnvjfQWxicmWVdrEOAwyqbk5bDFy4gV/XwxFvwW2ciwiRnqzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ZR3QQb0FdA8Lhy6GntZIxBKaXOuVuNQ04JiaqvujbvcCjvy6
	csh1dpA/PzL9xjCK7HIW27Cq9/PCm3GNB26iXaaRA0lPvduqt00aQP4r
X-Gm-Gg: AZuq6aJXxe8gSbt7dyMLwhqhET3+O7MfoD1pG/3HWDQeKd3js4FCH6XXBJ2M5aIYuNG
	TYcZQ3ygurGsY0cU48sLt5lJlMP/h/JP0CKtqEj9t5W85a5xWTmy2DlEfkOyoiuJQ/kafuspkkt
	BchZO8I6nvEM5se4zKmzX1K3EcAJ5JDBKOrpiC+iqgULoonVSjO1xXct41N1DGVXc68p1tPRNcv
	33Z9G9iW86vetrbtikw4GIZpOO7VWUMGApTewmGCbfmVrWqLfyHJAw2GQZUCKMfB3sHmf3ubFO6
	0KRQxtBrwfq/ZmGiBNWSDqPZZMdi2wxPvbYSs3D2J8e9XFaFkbppnSTBJoTGCD3Pn2aRe6481Vl
	v2TvBhEeFUaAjEQpErCE6LROsTqI6fJoSLsvQAtA8QdilzyPbGbwH8vETMCgh/yFlt61QWgx3pR
	+OHZvkn4J3I+vXtZbejB8DJGYKzm0eXd9yFaAFHg+hRZg+FxSgTStlLdAaxwpfxKhv4m1WYe4fZ
	YQ3
X-Received: by 2002:a17:907:9715:b0:b84:2b70:98ec with SMTP id a640c23a62f3a-b8fb44d62efmr75438766b.42.1770981295511;
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fbe407520sm3908666b.43.2026.02.13.03.14.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
Date: Fri, 13 Feb 2026 12:14:43 +0100
Cc: Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Message-Id: <D93350ED-72E3-43B5-BA4F-42E0FE491B2A@gmail.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_031458_206663_6579AAB0 
X-CRM114-Status: GOOD (  12.74  )
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

Cgo+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gdyBkbml1IDEzIGx1dCAyMDI2LCBvIGdvZHouIDA5OjU1Ogo+IAo+IE9uIDEz
LzAyLzIwMjYgMDk6MzEsIFpoZW50YW8gR3VvIHdyb3RlOgo+Pj4+Pj4gCj4+Pj4+IFdoeT8gV2hh
dCBmb3I/Cj4+Pj4+IAo+Pj4+PiBXaGF0IGlzIGNhbnZhcyBwcm92aWRlcj8KPj4+PiBUaGUgY2Fu
dmFzIHByb3ZpZGVyIGlzOiBkcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNhbnZhcy5jCj4+PiBX
aGF0IGlzIHRoaXMgImNhbnZhcyIgZGV2aWNlLgo+PiBZb3UgY2FuIHRoaW5rIG9mIGNhbnZhcyBh
cyB0aGUgYWdlbnQgdGhyb3VnaCB3aGljaCB0aGUgZGVjb2RlciBoYXJkd2FyZSAKPj4gYWNjZXNz
ZXMgRERSLgo+IAo+IEFHQUlOOgo+IAo+IFdoYXQgaXMgdGhlIGNhbnZhcyBkZXZpY2UuIERlc2Ny
aWJlIG9yIHBvaW50IG1lIHRvIGJpbmRpbmdzIGRlc2NyaWJpbmcKPiBpdC4gWW91ciBjdXJyZW50
IGJpbmRpbmdzIHNheSB0aGF0IGNhbnZhcyBpcyAiYSBjb2xsZWN0aW9uIG9mIG1ldGFkYXRhCj4g
dGhhdCBkZXNjcmliZXMgYSBwaXhlbCBidWZmZXIiIHNvIHRoZXJlIGlzIG5vIHdheSBpdCBoYW5k
bGVzIEREUiBhY2Nlc3MuCj4gCj4gTkFLCj4gCj4+Pj4gSW4gc2hvcnQsIGNhbnZhcyBpcyBhIGhh
cmR3YXJlIElQIGluc2lkZSB0aGUgQW1sb2dpYyBTb0MuIFRoZSBkZWNvZGVyIElQCj4+Pj4gbmVl
ZHMgdG8gYWNjZXNzIEREUiB0aHJvdWdoIGNhbnZhcyBJUCwgc28gd2UgbmVlZCB0byByZWZlcmVu
Y2UgdGhlCj4+PiBXaHkgZGVjb2RlciBjYW5ub3QgYWNjZXNzIEREUiBkaXJlY3RseT8KPj4gVGhl
IGludGVybmFsIHRvcG9sb2d5IG9mIHRoZSBTNCBjaGlwIGlzIGRlc2lnbmVkIHRoaXMgd2F5LCB3
ZSBkb24ndCBrbm93IAo+PiB3aHkgb3VyIFZMU0kgY29sbGVhdWdlcyBkZXNpZ25lZCBsaWtlIHRo
aXMuIEJ1dCBzaW1pbGFyIGRlc2lnbnMgaGF2ZSAKPj4gYmVlbiByZW1vdmVkIGluIHN1YnNlcXVl
bnQgY2hpcHMsIGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIHJlbHkgb24gYSAKPj4gY29tbW9uIGhh
cmR3YXJlIElQLgo+IAo+IFF1aXRlIHBvb3IgZXhwbGFuYXRpb24uIEJhc2VkIG9uIHRoaXMsIHRo
aXMgYXMgd2VsbCBjb3VsZCBiZSBlbnRyeSBpbgo+IGRldmljZSByZWcgbGlzdHMuCj4gCj4gQW55
d2F5LCBJIGFtIGRvbmUgZ3Vlc3NpbmcsIGV4cGxhaW4gcHJvcGVybHkgdGhlIGhhcmR3YXJlIGlu
c3RlYWQgb2YKPiBhbnN3ZXJpbmcgd2l0aCBoYWxmLWJha2VkIHJlc3BvbnNlcyBqdXN0IHNvIEkg
d2lsbCBnbyBhd2F5Lgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCktyenlz
enRvZiwKCk1heSB5b3UgcGxzIGV4cGxhaW4gbWU6IHdoYXQgYWRkZWQgdmFsdWUgLSB0byB1cHN0
cmVhbWluZyBhbWwgdmlkZW8gZGVjb2RlciAtIHdpbGwgYmUgcHJvdmlkZWQgYnkgZ2l2aW5nIE5B
SyAuLi4uIGJlY2F1c2UgY2FudmFzL0REUiBhY2Nlc3MgZGV0YWlscyBleHBsYW5hdGlvbnMgYXJl
IG5vdCBlbm91Z2ggZGV0YWlsZWQgRk9SIFlPVT8KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
