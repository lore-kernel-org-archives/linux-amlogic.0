Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E901606A325
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zt5FQ9C1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=DZPLUL18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZDnhjd0PoRbx20vhGfu950bUcMYNOKMGfRk0WeYMiwA=; b=zt5FQ9C1IAwzjxK3MkO/l9jE19
	N0loXgSh5GItvVkmSCw5tsyV50Di3m2nimK80BueL4hndB/Pew93Tnp9SECAGyo7XI5flBDAR5UdY
	ElT43yte7uWcNvdGKgJlnoXv1ltt5wuuEG7MlhCivNZzp0MWIh+SP6x2VD8iZfPz+NPVw5rjzig7k
	DpLwwv7nbKp9yl9NkTJFs0DzW4M+rEFTy7liuv3X+BN4y55GtlW93bGDI5Potw1801rp0V+/Jw+es
	bQIDJfwQFTLsXLvRsGYZsKd3yAnADQCRuO4aAzimfWHHqCixNJilf2fA8pTlvOF7vcuD89H/8ug95
	YU47VmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl3X-0000000A5Le-0nZC;
	Wed, 18 Nov 2026 19:10:55 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl3T-0000000A5K5-25T5;
	Wed, 18 Nov 2026 19:10:53 +0000
Message-ID: <f0c5f3ae-5a37-4f38-bd32-6191a6a98485@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795029044;
	bh=y9UgIWQynPgPoVUM6/yn261u+b/dkSIroE44iaL3T2g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DZPLUL186iJM63saUsDmf+QkaMlJDFQ0b3i6Pn4Ivn7rDVbd+CdgMfNGuJ5E61TgN
	 4nqWYMEs0NZYMTWbpqLapborXRKZ7R0tLvAAFshU3+Irce7MP/AlT4f3tisXyihh+g
	 56re9lp/cNYBe2c8rEQimJQQU13wKmVciZzaOq40=
Date: Wed, 18 Nov 2026 20:10:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
 <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Content-Language: en-US
In-Reply-To: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_111052_090580_2B86FBF6 
X-CRM114-Status: GOOD (  12.83  )
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

T24gMTEvMTgvMjYgMTM6MzQsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDExLzE3LzI2IDIw
OjMzLCBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+IEZyb206IFJvbmFsZCBD
bGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+Pgo+PiBUaGUgSERNSSBUWCBQSFkg
bm93IGhhcyBpdHMgb3duIGJpbmRpbmcgYW5kIGRyaXZlci4gRGVzY3JpYmUgdGhlIGxpbmsKPj4g
YmV0d2VlbiB0aGUgSERNSSBUWCBjb250cm9sbGVyIGFuZCBpdHMgUEhZIHdpdGggYSAicGh5cyIg
cHJvcGVydHkKPj4gaG9sZGluZyBhIHNpbmdsZSBwaGFuZGxlLCBuYW1lZCAiaGRtaSIgdGhyb3Vn
aCAicGh5LW5hbWVzIiwgYW5kIHVwZGF0ZQo+PiB0aGUgZXhhbXBsZSBhY2NvcmRpbmdseS4KPj4K
Pj4gVGhlIHByb3BlcnRpZXMgYXJlIG9wdGlvbmFsIHNvIHRoYXQgZXhpc3RpbmcgRFQsIHdoaWNo
IGRvIG5vdCBkZXNjcmliZQo+PiB0aGUgUEhZLCBrZWVwIHZhbGlkYXRpbmc7IHRoZSBkcml2ZXIg
ZmFsbHMgYmFjayB0byBjcmVhdGluZyB0aGUgUEhZCj4+IGl0c2VsZiBpbiB0aGF0IGNhc2UuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVs
LmZyPgo+PiAtLS0KPj4gwqAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2lj
LG1lc29uLWR3LWhkbWkueWFtbMKgwqDCoMKgwqDCoMKgIHwKPj4gOCArKysrKysrKwo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLQo+PiBkdy1o
ZG1pLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS8KPj4g
YW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPj4gaW5kZXggNDE2ZmUyNjNhYzkyLi41YTAzM2Zl
YzIxYjAgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2FtbG9naWMsbWVzb24tZHctCj4+IGhkbWkueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LQo+PiBoZG1p
LnlhbWwKPj4gQEAgLTEwOCw2ICsxMDgsMTIgQEAgcHJvcGVydGllczoKPj4gwqAgwqDCoMKgIHNv
dW5kLW5hbWUtcHJlZml4OiB0cnVlCj4+IMKgICvCoCBwaHlzOgo+PiArwqDCoMKgIG1heEl0ZW1z
OiAxCj4+ICsKPj4gK8KgIHBoeS1uYW1lczoKPj4gK8KgwqDCoCBjb25zdDogaGRtaQo+IAo+IEkg
ZG9uJ3QgdGhpbmsgcGh5cy1uYW1lIGlzIG5lY2Vzc2FyeSBoZXJlLgoKT2ssIEkgd2lsbCBkcm9w
IHBoeS1uYW1lcyBhbmQgdXNlIE5VTEwgYXMgbmFtZSBpbiB0aGUgZHJpdmVyIGluc3RlYWQuCgo+
IAo+PiArCj4+IMKgIHJlcXVpcmVkOgo+PiDCoMKgwqAgLSBjb21wYXRpYmxlCj4+IMKgwqDCoCAt
IHJlZwo+PiBAQCAtMTM2LDYgKzE0Miw4IEBAIGV4YW1wbGVzOgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcG93ZXItZG9tYWlucyA9IDwmcGRfdnB1PjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwaHlzID0gPCZoZG1pX3R4X3BoeT47Cj4+ICvCoMKgwqDCoMKg
wqDCoCBwaHktbmFtZXMgPSAiaGRtaSI7Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBWUFUg
VkVOQyBJbnB1dCAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaGRtaV90eF92ZW5jX3BvcnQ6IHBv
cnRAMCB7Cj4+Cj4gCgoKLS0gCkJlc3QgcmVnYXJkcywKUm9uYWxkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
