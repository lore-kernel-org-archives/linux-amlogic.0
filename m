Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28CCC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIQDmtZcbJJ9AdKsmEfnXojqv9oZIdsOU6y2eiFJ7v4=; b=sunr3CFmMEHXte6DCDiTmQaO+N
	FHpayDZxl6CE6TFdjW4lyZDBTilJZHebTf3dUE/YlxFcn4NqHBjXdmsgCiwk4WluSJ5yqISBlD6BD
	l1i6dSgv2GIZ3UE5b1Et7WDLZ9KEMnu1GYmtztK6U4jTXaOhmLgFWXqIeCOeRl1noXcszvCWIgd5v
	mz6Mj6NVLPMFAgU4YBXPEqAHcptRsVnOyTlk0/rIyvOQpadYPjcJNcpIvMnajPnLwUhWZSF3GxVeH
	RV6furqW3MESk1/m5tMFIeLygrBDhM5QAzC1t80hmC82lgMEmubeGhgNVbShEwvGQZ14q8clNPDMU
	wstploww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTyq-008gTw-WB; Fri, 29 Jul 2022 17:40:57 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTbK-007VAv-Uh; Fri, 29 Jul 2022 17:16:40 +0000
Received: by mail-lj1-x234.google.com with SMTP id h12so5869154ljg.7;
        Fri, 29 Jul 2022 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5tQz/NMPslChwSMnONrCdmO2dJnpmKkolnTnPw4eCOM=;
        b=fSDE7YVh9xbFTXNS5LZLQJheA3LRFlbSKRw0HJ3975j8T+YkBi3sUY5F44r6tJBPY4
         ibnp1PMNUq604gAh8Dd18ErP5mkljzVJd7R1o1kHrDRHMI5CFFv+ZsXg4mQ+EhM+uW8F
         kFsjJtGSEV4ForHBQnE5GCAHMjU8+iMLpKimKthWH29A3jBi4P6EQ9rV9w++4CdaNolE
         ssS0cY9s5N8tmcv0UQ3xlrlcOEbxgiPedVEIJHIAE4iEOpLLwUj83wPSFhLPrgMWtCwJ
         pZt4RqOCiK1/ncaLRZzoA3UEfzJdNi2xDOe/bzykpCAAav5k7WfoRcqkV5b1I6XdwD3M
         t+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5tQz/NMPslChwSMnONrCdmO2dJnpmKkolnTnPw4eCOM=;
        b=uZ7KjaS0rnek/2NZy15r301Jwj2/+qSOYH9vsPIV6GMSgE9bzE9agIV1yC+tgm4IS3
         6Q7YsUkvR4DIUs+0V/kUNZ5JzDYGG6+X40n1L5l91pIaDzt35CZKnVktRq6lqK8cQ0WY
         4g3NcMywmuzhBhGg/KCbCz3vnEIwiVMu7ONI9Y9gc5sndNA5LMaTW7P0wkHNTdjrdQQw
         Lkr0Wf+rJz+4rM6MlxiIb4Pef+1oAl2howuaY9yFgN36dHZu7bdk43y6amkLg9BTSdlb
         bL216T/kc/8uZSA32FH/74AUYNwq+w+6V8gnY9nQ0cCV4UnDy2vmKs+4hHosgmh4Ujxr
         1WdA==
X-Gm-Message-State: AJIora+aIkRJujustcXX3nXP0nVfOKQRAoGEENck+fNduyDOgtOonzB+
	5o5xqHKJ4gW3xLbZz3e+Ho0=
X-Google-Smtp-Source: AGRyM1udnGMHy9uVMFfvjher5OK+mYMcBbqbsG+Mld7ipyIFF7Ud6/dNHXBQ7phe91Mt/V4O5m1lhw==
X-Received: by 2002:a2e:6101:0:b0:25d:eb9d:4c79 with SMTP id v1-20020a2e6101000000b0025deb9d4c79mr1467737ljb.354.1659114996070;
        Fri, 29 Jul 2022 10:16:36 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs377004.centertel.pl. [37.47.103.237])
        by smtp.googlemail.com with ESMTPSA id a29-20020a19ca1d000000b0047f7b641951sm712762lfg.272.2022.07.29.10.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 10:16:35 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
Date: Fri, 29 Jul 2022 19:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 14/35] drm/atomic-helper: Add an analog TV atomic_check
 implementation
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_101639_062130_AF1D1861 
X-CRM114-Status: GOOD (  20.23  )
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

SGkgTWF4aW1lLAoKSSdtIHByZXR0eSBzdXJlIHRoYXQgUEFMLTYwIGFuZCBTRUNBTS02MCBzaG91
bGQgYmUgdGllZCB0byB0aGUgNDgwaSAKbW9kZS4gVGhvc2UgYXJlIG5vbi1zdGFuZGFyZCAibm9y
bXMiIHRoYXQgdXNlIDYwIEh6IHN5bmMgKHdoaWNoIGlzIApsYXJnZWx5IHN5bm9ueW1vdXMgd2l0
aCA0ODBpIGluIHRoZSBhbmFsb2cgVFYgd29ybGQpIHdpdGggUEFML1NFQ0FNIApjb2xvciBlbmNv
ZGluZy4KCkJlc3QgcmVnYXJkcywKTWF0ZXVzeiBLd2lhdGtvd3NraQoKVyBkbml1IDI5LjA3LjIw
MjIgb8KgMTg6MzQsIE1heGltZSBSaXBhcmQgcGlzemU6Cj4gVGhlIGFuYWxvZyBUViBjb25uZWN0
b3IgZHJpdmVycyBzaGFyZSBzb21lIGF0b21pY19jaGVjayBsb2dpYywgYW5kIHRoZSBuZXcKPiBU
ViBzdGFuZGFyZCBwcm9wZXJ0eSBoYXZlIGNyZWF0ZWQgYSBidW5jaCBvZiBuZXcgY29uc3RyYWlu
dHMgdGhhdCBuZWVkcyB0bwo+IGJlIHNoYXJlZCBhY3Jvc3MgZHJpdmVycyB0b28uCj4KPiBMZXQn
cyBjcmVhdGUgYW4gYXRvbWljX2NoZWNrIGhlbHBlciBmb3IgdGhvc2UgdXNlIGNhc2VzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYwo+IGluZGV4IDZkMTRjYjBjNjRi
MS4uZmNlNTU2OWJkNjZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X3N0YXRlX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVf
aGVscGVyLmMKPiBAQCAtNTUyLDYgKzU1Miw5MyBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl90dl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAgfQo+
ICAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfcmVzZXQpOwo+
ICAgCj4gKy8qKgo+ICsgKiBAZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X2NoZWNrOiBW
YWxpZGF0ZSBhbiBhbmFsb2cgVFYgY29ubmVjdG9yIHN0YXRlCj4gKyAqIEBjb25uZWN0b3I6IERS
TSBDb25uZWN0b3IKPiArICogQHN0YXRlOiB0aGUgRFJNIFN0YXRlIG9iamVjdAo+ICsgKgo+ICsg
KiBDaGVja3MgdGhlIHN0YXRlIG9iamVjdCB0byBzZWUgaWYgdGhlIHJlcXVlc3RlZCBzdGF0ZSBp
cyB2YWxpZCBmb3IgYW4KPiArICogYW5hbG9nIFRWIGNvbm5lY3Rvci4KPiArICoKPiArICogUmV0
dXJuczoKPiArICogWmVybyBmb3Igc3VjY2VzcywgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGVy
cm9yLgo+ICsgKi8KPiAraW50IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9jaGVjayhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+ICsJCQkJCSBzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpCj4gK3sKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpvbGRf
Y29ubl9zdGF0ZSA9Cj4gKwkJZHJtX2F0b21pY19nZXRfb2xkX2Nvbm5lY3Rvcl9zdGF0ZShzdGF0
ZSwgY29ubmVjdG9yKTsKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29ubl9z
dGF0ZSA9Cj4gKwkJZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29u
bmVjdG9yKTsKPiArCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwo+ICsJc3Ry
dWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwo+ICsJc3RydWN0IGRybV9jcnRjICpjcnRj
Owo+ICsKPiArCWNydGMgPSBuZXdfY29ubl9zdGF0ZS0+Y3J0YzsKPiArCWlmICghY3J0YykKPiAr
CQlyZXR1cm4gMDsKPiArCj4gKwljcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNf
c3RhdGUoc3RhdGUsIGNydGMpOwo+ICsJaWYgKCFjcnRjX3N0YXRlKQo+ICsJCXJldHVybiAtRUlO
VkFMOwo+ICsKPiArCXN3aXRjaCAobmV3X2Nvbm5fc3RhdGUtPnR2Lm5vcm0pIHsKPiArCWNhc2Ug
RFJNX01PREVfVFZfTk9STV9OVFNDXzQ0MzoKPiArCQlmYWxsdGhyb3VnaDsKPiArCWNhc2UgRFJN
X01PREVfVFZfTk9STV9OVFNDX0o6Cj4gKwkJZmFsbHRocm91Z2g7Cj4gKwljYXNlIERSTV9NT0RF
X1RWX05PUk1fTlRTQ19NOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9UVl9O
T1JNX1BBTF9NOgo+ICsJCW1vZGUgPSAmZHJtX21vZGVfNDgwaTsKPiArCQlicmVhazsKPiArCj4g
KwljYXNlIERSTV9NT0RFX1RWX05PUk1fUEFMXzYwOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2Fz
ZSBEUk1fTU9ERV9UVl9OT1JNX1BBTF9COgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1f
TU9ERV9UVl9OT1JNX1BBTF9EOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9U
Vl9OT1JNX1BBTF9HOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9UVl9OT1JN
X1BBTF9IOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9UVl9OT1JNX1BBTF9J
Ogo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9UVl9OT1JNX1BBTF9OOgo+ICsJ
CWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1fTU9ERV9UVl9OT1JNX1BBTF9OQzoKPiArCQlmYWxs
dGhyb3VnaDsKPiArCWNhc2UgRFJNX01PREVfVFZfTk9STV9TRUNBTV82MDoKPiArCQlmYWxsdGhy
b3VnaDsKPiArCWNhc2UgRFJNX01PREVfVFZfTk9STV9TRUNBTV9COgo+ICsJCWZhbGx0aHJvdWdo
Owo+ICsJY2FzZSBEUk1fTU9ERV9UVl9OT1JNX1NFQ0FNX0Q6Cj4gKwkJZmFsbHRocm91Z2g7Cj4g
KwljYXNlIERSTV9NT0RFX1RWX05PUk1fU0VDQU1fRzoKPiArCQlmYWxsdGhyb3VnaDsKPiArCWNh
c2UgRFJNX01PREVfVFZfTk9STV9TRUNBTV9LOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBE
Uk1fTU9ERV9UVl9OT1JNX1NFQ0FNX0sxOgo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUk1f
TU9ERV9UVl9OT1JNX1NFQ0FNX0w6Cj4gKwkJbW9kZSA9ICZkcm1fbW9kZV81NzZpOwo+ICsJCWJy
ZWFrOwo+ICsKPiArCWRlZmF1bHQ6Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJ
aWYgKCFkcm1fbW9kZV9lcXVhbChtb2RlLCAmY3J0Y19zdGF0ZS0+bW9kZSkpCj4gKwkJcmV0dXJu
IC1FSU5WQUw7Cj4gKwo+ICsJaWYgKG9sZF9jb25uX3N0YXRlLT50di5ub3JtICE9IG5ld19jb25u
X3N0YXRlLT50di5ub3JtKQo+ICsJCWNydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7Cj4g
Kwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9j
b25uZWN0b3JfdHZfY2hlY2spOwo+ICsKPiAgIC8qKgo+ICAgICogX19kcm1fYXRvbWljX2hlbHBl
cl9jb25uZWN0b3JfZHVwbGljYXRlX3N0YXRlIC0gY29weSBhdG9taWMgY29ubmVjdG9yIHN0YXRl
Cj4gICAgKiBAY29ubmVjdG9yOiBjb25uZWN0b3Igb2JqZWN0Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWlj
X3N0YXRlX2hlbHBlci5oCj4gaW5kZXggYzhmYmNlNzk1ZWU3Li5iOTc0MGVkYjI2NTggMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuaAo+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmgKPiBAQCAtMjYsNiArMjYsNyBAQAo+
ICAgCj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgIAo+ICtzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZTsKPiAgIHN0cnVjdCBkcm1fYnJpZGdlOwo+ICAgc3RydWN0IGRybV9icmlkZ2Vfc3Rh
dGU7Cj4gICBzdHJ1Y3QgZHJtX2NydGM7Cj4gQEAgLTcxLDYgKzcyLDggQEAgdm9pZCBfX2RybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAo+ICAgCQkJCQkgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOwo+
ICAgdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3Rvcik7Cj4gICB2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90
dl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsKPiAraW50IGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9jaGVjayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAo+ICsJCQkJCSBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOwo+ICAgdm9pZCBk
cm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfbWFyZ2luc19yZXNldChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKTsKPiAgIHZvaWQKPiAgIF9fZHJtX2F0b21pY19oZWxwZXJfY29u
bmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
