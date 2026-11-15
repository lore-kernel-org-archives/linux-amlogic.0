Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D4606A33A
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f7AGwnVC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=OTu8FLy4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=658bNCj9X2bICV5aT1GXMBvak/l1OgSRZmx31sESgpY=; b=f7AGwnVCoFihnICJ86zYQ3TyrL
	AbBTxUnY5gLyII6uFL02AZyFmkXxcIZk2LHftmld2xI5t8GtafI8y2evmcEoPetkgZIF5ktNZvmed
	+onvFn2qaXzvUL3dulhqB3h3i5PQpPqKgW+fzU3D3MoOLTpK1zo+sezbL5B3qcK7tmThQO9JJI+dv
	QCHd0wODg5DhqWScx+9d5n9lpIlxRtDzj8Cn4SZhnif+LPMRUyrXFwybpSfYIHDE4CM9WNdbBi0ox
	ojlBhxTU+GF1LAQLur709122dX4vY9xNJ54I8kQgTWvvlBS0Mt8wOHIQNfJLfGcnPzYOEQCAtIsM8
	5AK9E44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSint-00000000fRE-3N7o;
	Sun, 15 Nov 2026 22:34:29 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSinq-00000000fQL-2sCv;
	Sun, 15 Nov 2026 22:34:28 +0000
Message-ID: <6c03c104-a86d-4ddf-b519-793a1da7151e@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1794782062;
	bh=r7WkL7hnoxRmrnQQzh+AibupBsiHGW98gVTJzxJfnBE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=OTu8FLy4omu5a28TNtfvdyeXHr9qsC+pa9ZIoHaUjUqSJPqpymtxlEysJrWDTdt1f
	 yD1Zs9/FAg7EGkDfPHy2+V/tYUIb/oJoTq6xek5oDKBJiOtIGzTjJjxoLOnQESjQvX
	 0BoyrPCX3vaHjppBJM6y54J8UcfaRivtPgmNBOQU=
Date: Sun, 15 Nov 2026 23:34:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
 <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
 <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_143427_180323_31B2830C 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTUvMjYgMjM6MjAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gT24gVGh1LCBP
Y3QgMSwgMjAyNiBhdCA2OjU24oCvUE0gUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5Cj4gPGRl
dm51bGwrbGludXgta2VybmVsLWRldi5hbGllbC5mckBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
RnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4+Cj4+IERl
c2NyaWJlIHRoZSBzeXN0ZW0gY2xvY2sgb2YgZWFjaCBQV00gY29udHJvbGxlciBhcyBhIHRoaXJk
IGNsb2NrLAo+PiBhbmQgYWRkIHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0eSBleHBlY3RlZCBieSB0
aGUgdXBkYXRlZCBiaW5kaW5nOgo+PiAiY2hhbm5lbC1hIiwgImNoYW5uZWwtYiIgYW5kICJidXMi
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBh
bGllbC5mcj4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiAKPj4gLS0tCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaSB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1hMS5kdHNpICAgfCAxMiArKysrKysrKystLS0KPj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpICAgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+IG5v
dGU6IGEgc2luZ2xlIHBhdGNoIHBlciBTb0MgaXMgZWFzaWVyIGZvciBtZSB0byByZXZpZXcgYnV0
IHdlIGRvbid0Cj4gaGF2ZSBhIHN0cmljdCBydWxlLgoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNr
LCBJIHdpbGwgc3BsaXQgdGhlbSBuZXh0IHRpbWUgaWYgSSBoYXZlIGEKc2ltaWxhciBvbmUuCgot
LSAKQmVzdCByZWdhcmRzLApSb25hbGQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
