Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230ABC87FCA
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfw8m+9PSY+bf4wbdQr+oFVyc1h0wEUEjhA8Wr1MrvU=; b=bZsdvyvAiuyYfX
	O3Y97/Xfqt+9khu/EBgkI1F9JWt3T7FJeydXwpy6U1JDYPwKwn8f52quHFmai14Nv2HAQiPeRjn20
	NJwxMsMZTdMoodb+3MPSVez6Y21fDbPUtFvUgqFN7pyN3xX/G+9uc1ndGAeOWg5jETATseF1OQTYz
	ilSx7MQswn4i0aV7JwnKOuZLddCgl/58j5j/fXqpYEED0v5i20M9GRGIRcrQ3oRttySaHHQ9y8YEw
	OTPF5IbhEPdgyeV3KIt+Xd/nSIOifagMFvVYCV6JJ3DB/XMS6iHNvOvSX/cTo068eslZ14GKpYFdx
	J+Ft8S6hP2ZFx3dfviJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o3-00000008Dj1-0jEw;
	Thu, 24 Jul 2025 18:36:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezQi-000000085gW-1e64;
	Thu, 24 Jul 2025 17:08:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235a3dd4f0dso8055725ad.0;
        Thu, 24 Jul 2025 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753376907; x=1753981707; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGE95oQU+G3JZiNfJBXGaa5iowQ3KE+3XsZUyctMNlw=;
        b=nqM1i09jp6n9jW/R1b++6XLBbpPr41ZknyERTVBU67tqNtQNJdP2KWWQh4IGWhfets
         o7zQtWnrI1ER3bXseRNQ24a5aXUbHGRNx4j1qmJ20eue+V5rbT2TDT7dAcazA2Lrs5cj
         181p+34n6ZfN1VzDjugnlbUUOwuNm+YrivGr6XHhpfKOTLxNW5tDCijBsMZ2zoXLlWlA
         hY5tQb+b9XUzyF5xOmZf8J0d70ciJys/9M57V9A42eKQcf2t+HrupcZ+Nb3DB2Bh7OV+
         DX37PA4mFPZPbgDDOJwDkOhe1KR/q2iq9BOE+Mjj3i+kDsCTUYCojy5T4UZovlJmzubN
         L7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753376907; x=1753981707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGE95oQU+G3JZiNfJBXGaa5iowQ3KE+3XsZUyctMNlw=;
        b=bcqtnAX8iILJnqVHuNdb6FdVDrj8gK751pYbK3HahinRifU7RKwlgIeNZ/5zRBEN+V
         LE4WW9dXGVVZ4/8oIji0g0G5Ze5rQynKSegmq39quLObYGBsl6TvNYvVIU+mJxUwm7Au
         +MD05uKK7MfAWuU9op6DUC6wAS4SB7hfQnc0SNeVnEswPo97EoN/Hqoz8mbZaCNbCcx6
         cQeJTpYyxROsqwwxFF2X6LSdKnsiGkbFQbvDMp4fvy5EFR32ljsLzPFAr3XfyQn+UTll
         vRAzabg1wGLnSLMjpkpTzOxeZiOutvGu3nRMmWYAMGolB90u9/sk3xN6iRvfeNIPGxbN
         qtgA==
X-Forwarded-Encrypted: i=1; AJvYcCVERjLAQ3yDXOzTpChUDaHYd6VCh5ULpZgAYbyPE+etI8j/h5WcT+xrg+l5HhDOlaY5bCTNADm4m6cPA8U3AOw3ow==@lists.infradead.org, AJvYcCWzQf0WCqGnQXEm1Hrj13DrGp2p1KoIO6F4C/me3gi9owggfAub2j0EH0f4yY5NJChjzdcjRS/c9t08biTw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+CggLZSdl3pntynoWcDU0HQvRCQ4SCoCXo9c2Sxcsjen2MnOa
	OVcVfyQ/vE1DNd1QU0MUKVALwR7bs+GRbfIknT5g2K+piYDodCUAqdca
X-Gm-Gg: ASbGncs7OFhhTMgqSl0bXpRgLdBK5rG6K+pLU5lqShlamXBTPqBBB8UyV1Gx7ATw5gS
	Y3c9gIqxS0F0yg0wdgMi0XtHTijjdwTBMpXbpUfnT15LS8QKRfAKSrVo3vrg7mdlSk5zbcQK8m/
	DVvWZ2G1ZWN4OtSfugeCxz3x4Hgpvl/nNN2aOocdTtY82a1Mu+tUiQn9IYKoo8VdQI/Gyz2n9PX
	daVTiv499snN3srMXJavfF136KDfdd2iagkHiHgWzO2bUG5q0Gq6FsAlEjfPb5TF/g0B9kDCEP4
	uTV45AR4Np2YL6CaEg2JRgTxyXR7m2YmqKrwikkd8bEgLPWUp9igPSHVrglte1WM6Ndu+dvXOkv
	4WpkWzdLtpZcF+Ookqj5PdV1/LyYeCKrSrs5mGqA=
X-Google-Smtp-Source: AGHT+IECIHPgvbnvMyXkL6JhqYISUuCy4X6A0DDs5uMshC624UH9yIdwB+tffpJsfG2tPfQ34zHI+g==
X-Received: by 2002:a17:903:3d10:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23f981bb92bmr94356815ad.28.1753376907010;
        Thu, 24 Jul 2025 10:08:27 -0700 (PDT)
Received: from [192.168.1.134] ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dd816sm19783735ad.136.2025.07.24.10.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 10:08:26 -0700 (PDT)
Message-ID: <8f4358e8-ecd6-4d86-8326-25d21c3a4ea2@gmail.com>
Date: Thu, 24 Jul 2025 22:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <20250724111247.669d6955@jic23-huawei>
Content-Language: en-US
From: Sanjay Suthar <sanjaysuthar661996@gmail.com>
In-Reply-To: <20250724111247.669d6955@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_100828_433781_5DD1EDED 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQvMDcvMjUgMTU6NDIsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gT24gVHVlLCAyMiBK
dWwgMjAyNSAyMjozNToxMyArMDUzMAo+IFNhbmpheSBTdXRoYXIgPHNhbmpheXN1dGhhcjY2MTk5
NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4+IEZpeCBtaW5vciBncmFtbWF0aWNhbCBpc3N1ZXMgYnkg
cmVtb3ZpbmcgZHVwbGljYXRlZCAiaXMiIGluIHR3byBkZXZpY2V0cmVlCj4+IGJpbmRpbmcgZG9j
dW1lbnRzOgo+Pgo+PiAtIG5ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPj4gLSBpaW8vZGFj
L3RpLGRhYzc2MTIueWFtbAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgU3V0aGFyIDxzYW5q
YXlzdXRoYXI2NjE5OTZAZ21haWwuY29tPgo+IEknZCBoYXZlIG5vIHByb2JsZW0gd2l0aCB0aGUg
YXJndW1lbnQgdGhhdCB0aGlzIGNhbiBnbyB0aHJvdWdoIGVpdGhlcgo+IHRyZWUgaWYgdGhlcmUg
d2FzIGFueSBpbnRlcmFjdGlvbiBiZXR3ZWVuIHRoZSBmaWxlcyBvciB0aGUgY2hhbmdlcywgYnV0
Cj4gaGVyZSB0aGVyZSBpc24ndC4gVGhpcyBpcyBqdXN0IGNhdXNpbmcgcG90ZW50aWFsIG1lc3Mg
aWYgZWl0aGVyIHRyZWUgZW5kcwo+IHVwIHdpdGggb3RoZXIgY2hhbmdlcyBvdmVybGFwcGluZyB0
aGlzIGZvciBubyBiZW5lZml0LiAgUGxlYXNlIHNwbGl0IGludG8KPiB0d28gcGF0Y2hlcywgb25l
IGZvciBlYWNoIHN1YnN5c3RlbS4gIFlvdSBzaG91bGQgYmUgZmluZSB0byBrZWVwIHRoZQo+IHZh
cmlvdXMgdGFncyBnaXZlbiBoZXJlIGZvciB0aGUgbmV3IHBhdGNoZXMuCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXcuIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4gcmVnYXJkaW5nIHNwbGl0dGluZyB0
aGUgCmNoYW5nZXMuIE15IGludGVudGlvbiB3YXMgdGhhdCwgc2luY2UgdGhlIGZpeCBpcyBhIHRy
aXZpYWwgYW5kIGlkZW50aWNhbCAKZ3JhbW1hdGljYWwgY29ycmVjdGlvbiBhY3Jvc3MgYm90aCBz
dWJzeXN0ZW1zLCBpdCBkaWRu4oCZdCBzZWVtIG5lY2Vzc2FyeSAKdG8gc2VwYXJhdGUgdGhlbS4K
Ckhvd2V2ZXIsIEnigJltIG9wZW4gdG8gZWl0aGVyIGFwcHJvYWNoIOKAlCBrZWVwaW5nIGl0IGFz
IGEgc2luZ2xlIHBhdGNoIG9yIApzcGxpdHRpbmcgaXQgaWYgdGhhdCdzIHByZWZlcnJlZC4gQXMg
SeKAmW0gc3RpbGwgbmV3IHRvIHRoaXMgcHJvY2VzcywgSeKAmWxsIApkZWZlciB0byBAa3J6eXN6
dG9mIGFuZCB0aGUgRFQgbWFpbnRhaW5lcnMgZm9yIHRoZSBmaW5hbCBjYWxsIG9uIGhvdyAKdGhp
cyBzaG91bGQgYmUgaGFuZGxlZC4KClBsZWFzZSBsZXQgbWUga25vdyB0aGUgcHJlZmVycmVkIGRp
cmVjdGlvbiwgYW5kIEnigJlsbCBiZSBoYXBweSB0byB1cGRhdGUgCmFjY29yZGluZ2x5LgoKQmVz
dCByZWdhcmRzLAoKU2FuamF5IFN1dGhhcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
