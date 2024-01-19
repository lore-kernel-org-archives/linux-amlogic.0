Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF4C47DB7
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jan 2024 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=St8DbQQjVeENWFjsn1gQeEqM/SKDUlRc7h0mzFGGINk=; b=CVe3260VOjqjA5
	9E2l8aPKsST9gnTIIiAA9VLDTy2GaLdZisXifYT34L+NQcwE+fnmbtRdOlrqar+xRNV7UXQ1Tqoju
	I++WnqrkMCAMaKnf2jBmV6kWyh8WGh6+eFryzZZ/SIHn3CNvvcpgK1iHGxvgwhZJeFALgbNoQGi+J
	+X3QW1PCVfdyqKLKR0v5GXDK74ZhU3V8Gd0WaAY+QFsxfZnfUSNQTxVs9vJoxaTLaqGCJWAA3fmAx
	TAcVY+NE5xxfc4IMJIQO/Dlb+JiCZpOYBgI+9IK5WPX6W455Jz6H0YHmv2UFouPgv7XyUoAG3ZrJm
	VGghpJV1zPrLMU7PhKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkpk-004vfK-0H;
	Fri, 19 Jan 2024 09:06:40 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkpf-004vb9-1F;
	Fri, 19 Jan 2024 09:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1705655178; x=1706259978; i=markus.elfring@web.de;
	bh=tXJxt9w/oJ0XNk3Nt2w4s8/VSDNpnSFcsu7XbSCZO8E=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=aUybcVrn8+PuDYUH6AeSQQ8VJlzJ1Qx/8byJ58qh9Aazw0T79hLPHe5Ldx00EKtl
	 B+JlRd7GyHwxxfsS3u4DD6SFvBA3xBttG1M1cBk3wfMI8GOcXkAqxl2vO1uaz9B6w
	 /lJFmprZm8VT2WxJEPCxniq6boraewCqG/NuoXzi5mtRGzf/UPxjnpiiVndtqV0ac
	 TNpw6fl5GC691pIUejheRq2/0q8WLHJsKQd6eOUse5B2WCudp33hlyNR7UX4hqE64
	 HQOXB1rfitXFp+9M04CEZTwilwetD3s00vmSF0Ah5IC3LTevbjoNbPJUkQddrDht5
	 BrSM6ymPRMYpSyQWMQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2xrq-1rPeMg2Pe8-003JVi; Fri, 19
 Jan 2024 10:06:18 +0100
Message-ID: <a5f974aa-826d-421b-bfe2-bb6c9b43ea9a@web.de>
Date: Fri, 19 Jan 2024 10:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunwu Chan <chentao@kylinos.cn>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240119074635.265218-1-chentao@kylinos.cn>
Subject: Re: [PATCH] meson-mx-socinfo: Fix possible null-pointer dereference
 issues in meson_mx_socinfo_init
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240119074635.265218-1-chentao@kylinos.cn>
X-Provags-ID: V03:K1:hyKdlCkKgO+YTVOmB/GLcZr1wgCtUsa5eeb6696qbaPYs4p0tvm
 Wra2BA76jeC0HAYFadK3zTM811Z1GpZWxG4iCWQ5Bk+trVGnKthKiHdAFS2TbN04JmxxTCx
 WONU3Oho+j5ZwCDdVyNhs2AqyTtnjqq4XRtR/jwqQJatLceP9A53aOnjo5HdqunAr+ij8gY
 32k/iA4rAfXkBY8Sfs/ZA==
UI-OutboundReport: notjunk:1;M01:P0:yQYyVCQBHUY=;rlZmCe3DMwly7gg/2lVoLdf5qij
 I3TUF3hYsnucVs3Qd6+tNNQId31RgWBb3ThwyBD7QFuabs3ssfuBM3x30YXK1KS0mvO+J0Da6
 xlalBgjWAvSVb2JVNUeGw811cCTHxFu08HkHlj/wplNFlcD5ETlSRYLbEiNQTMPG9C/P8tKYJ
 N3BHSuCDA5kDRNV4BlRq/gICGssNwNXMNoNoMyGP662U5yfoQr1u/vlEhiH4o9i8HcWaN2t6b
 up73fC8v+cHg97YzfwtltFrgj419V4w3raKYZxa7UQe8+loXFKhnKKTwXvrCsl+1nL9gm4B1P
 zWDEXW4/wcZEHD56iuAtdXaLcmfpYo1gqP7DXfvbixtRZZlmPzt+t9ic1Xf8kbgwxKP1/ZwuE
 hFwCGcEgo6b8s1EaQ8q+LkB7Z0ao5jFPt944YbtNHq+eoU2DrXOH0w/SXbdHGR38FPRi3OAuL
 ncLYfI9KWjaiWjMNh+2KgkJhijFBWzDUvu58YqJq0nIq8nmuqW+YOgqm+w18K87JrrRI+FYOk
 6ULUDA5hHB4eq+rNa3yxFN7yaw8WGTlorD9a/zx2HGCPaEigj5c7VT6E7XQNtIUZ2JP0jIj8a
 FSvvUCP7Y5m1pWFeyA3xRHLuCQNIB9Db0ZCugmuJG4OvC4SelECrbb2oufJgvbHH0qH9myJTK
 6p7vuOQKyrKHZvMzKRRzqz6bKnIb5G8F+lUY7PoKqxQcisCvgEscNLjr91t/Y8QzSfVZClpIq
 5AAwYX4IWDmJ6S/8ZXEnw1b3YvdW+9Wa4cDQbj65X/TVnlEBRPl5529NSUckDaX2hyckzMZXZ
 pwGPc4xlRidS2topeW+q618Fn8EwEtsO7axcRI7srTP15N7tV1m4/BFFeVOVbltsi+oKshqfe
 7hXFY/KmqEQhIbVEACvHLUi/ye8BwLpkSqQfwY0ucMkAYOrlTpJsK3PfHGcn3sQYcReEz6j9M
 cWxuJg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_010635_872550_E9A09667 
X-CRM114-Status: UNSURE (   9.73  )
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

PiBJbiBtZXNvbl9teF9zb2NpbmZvX3JldmlzaW9uLCBrYXNwcmludGYoKSByZXR1cm5zIGEgcG9p
bnRlcgo+IHRvIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBtZW1vcnkgd2hpY2ggY2FuIGJlIE5VTEwg
dXBvbiBmYWlsdXJlLgo+Cj4gU2ltaWxhcmx5LCB0aGUga3N0cmR1cF9jb25zdCBpbiB0aGUgbWVz
b25fbXhfc29jaW5mb19zb2NfaWQKPiByZXR1cm5zIGEgbnVsbCBwb2ludGVyIHdoZW4gaXQgZmFp
bHMuIEVuc3VyZSB0aGUgYWxsb2NhdGlvbiB3YXMgc3VjY2Vzc2Z1bAo+IGJ5IGNoZWNraW5nIHRo
ZSBwb2ludGVyIHZhbGlkaXR5LiBBdm9pZCBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgaXNzdWVz
LgoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gZm9yIHRoZSBjb21w
bGV0aW9uIG9mIHRoZSBlcnJvciBoYW5kbGluZwppbiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9uPwoKCuKApgo+ICsrKyBiL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tbXgtc29jaW5mby5j
Cj4gQEAgLTE2MCw2ICsxNjAsMTIgQEAgc3RhdGljIGludCBfX2luaXQgbWVzb25fbXhfc29jaW5m
b19pbml0KHZvaWQpCj4gIAkJCQkJCQkgICBtZXRhbF9yZXYpOwo+ICAJc29jX2Rldl9hdHRyLT5z
b2NfaWQgPSBtZXNvbl9teF9zb2NpbmZvX3NvY19pZChtYWpvcl92ZXIsIG1ldGFsX3Jldik7Cj4K
PiArCWlmICghc29jX2Rldl9hdHRyLT5yZXZpc2lvbiB8fCAhc29jX2Rldl9hdHRyLT5zb2NfaWQp
IHsKCkkgc3VnZ2VzdCB0byBzcGxpdCBzdWNoIGEgY2hlY2sgZm9yIG51bGwgcG9pbnRlcnMuCgoK
PiArCQlrZnJlZV9jb25zdChzb2NfZGV2X2F0dHItPnJldmlzaW9uKTsKPiArCQlrZnJlZV9jb25z
dChzb2NfZGV2X2F0dHItPnNvY19pZCk7Cj4gKwkJa2ZyZWUoc29jX2Rldl9hdHRyKTsKPiArCQly
ZXR1cm4gLUVOT01FTTsKPiArCX0KPiAgCXNvY19kZXYgPSBzb2NfZGV2aWNlX3JlZ2lzdGVyKHNv
Y19kZXZfYXR0cik7Cj4gIAlpZiAoSVNfRVJSKHNvY19kZXYpKSB7Cj4gIAkJa2ZyZWVfY29uc3Qo
c29jX2Rldl9hdHRyLT5yZXZpc2lvbik7CgpQbGVhc2UgdXNlIGEgZ290byBjaGFpbiBmb3IgYmV0
dGVyIGV4Y2VwdGlvbiBoYW5kbGluZy4KaHR0cHM6Ly93aWtpLnNlaS5jbXUuZWR1L2NvbmZsdWVu
Y2UvZGlzcGxheS9jL01FTTEyLUMuK0NvbnNpZGVyK3VzaW5nK2ErZ290bytjaGFpbit3aGVuK2xl
YXZpbmcrYStmdW5jdGlvbitvbitlcnJvcit3aGVuK3VzaW5nK2FuZCtyZWxlYXNpbmcrcmVzb3Vy
Y2VzCgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
