Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FECC3ABBC
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 May 2025 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzANcl31nYMCr8sCjxY/IPelT0xK0ETdolgSx0frw3k=; b=PO8wJy2vmZTEdS
	aKMi97Qu6QAAQuE2B/86nuIQi6DyhQlLB/onqj99ckLtsG5/gwj6X0MaKImwYK3QcGfEn5j+Tgn0N
	SYk7N9uJMxNkt4xEGdFOjhddY0bP38U16tcSDqZH9BL/UOwKun5JKAR5VH8RM/DealHGX30d1AGh0
	UdXb+iqaZCjiPJEAIesLzJN70VLP+S6KeRZzyctLnw4/SOyh3hn7PFG6DSe226XmK/0I6r98cMGeP
	jzA/JA7eeyU366OLgl+ZbL/RkFYXDyy5SdFS0YmNWCS2HYpUY0ZR7zEPBb1CCqRspxRq4NxgaIjOc
	Ud+lTuPNtdUqMBR5zO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQFP-000000094xJ-16ro;
	Mon, 12 May 2025 10:18:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPZJ-00000008xWh-3gx2
	for linux-amlogic@lists.infradead.org;
	Mon, 12 May 2025 09:35:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso2433818f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 May 2025 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042528; x=1747647328; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbOjYfsn2Snomp7Q9KJqmaxWA7mFg+pHHLmdmLU++MU=;
        b=nIPJu/PE4MjWtogS7eQF+zW2x6i/ju474pQY7gfk2p2F8QHkfwEUwNgtVlBa/QqMfX
         S3nVSWXGo8FhXPHShz1LlUSb2CuB90rv/wnNxjI7RRlpBsCJa8mTcr3VlOLAtOQ5MgWt
         SQZyTS2xkf6s0fQ0QT+G5LiIGtyvL+GlekW30hNrMOxXIYJzVSIT76E6uwX6sQbG/0NC
         yt7SmfYyd9d5+j/Xh5vluoMKzZOG47r4tX8zbVHqtVBbuyXyoOPX2pG5mZKmEg5DNErP
         si+kXCrCehohw7jlc3PsovjpqxssojegVubKoNW8pdMFVPrDhE3WEWW6MZ9+fE0aAx3y
         pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042528; x=1747647328;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbOjYfsn2Snomp7Q9KJqmaxWA7mFg+pHHLmdmLU++MU=;
        b=jg/6ykX6zQ9tfNXB6umy+UNQoniJBm4QlOBOLLk8aR6Gi12kA5YgaJelGkPV518mDR
         CT4ZSdxDPGwnLkmrXoX7ttsFqX+oNdKbg3wD4R1ZiU4oXbBX0DIPzhhM1iWTnUDrqPD2
         cshOwbn6j4tNIFJoolw95pwfYVekJ9D/gGPSCXWKY5ubTXa0iddFzVnOKcHtbaxZ0LOe
         MvNO2Vq3Yz3Zp2kkJiKvQHBjq4c0TaYV6V5hrEf2pnarh7CGlzE5je3bAFBHPQ6W1NBt
         32Ik+PEfn6g1sFv60Ylqi1zMrrTD2jtGWxiBYpi+EbbJI4d6W7LAeJLWTF86GTSpmzYi
         37ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXsWPhN00yagq++gAW0tfjAqNXqpuFupZSxNLOg2YJ1Z/wNCQChzundWbLdrVNI0iv0FeB0AqaWD6TdNdAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwM2G0TF+524ZyDf5LHNsFjp9P0EeWa1XGIAxFvoaGbyW/fGZHs
	OVNMKFlVFT4DhMYoQ+g0taUfOErj2JAh55NYoj+sYgsCw68XVitj
X-Gm-Gg: ASbGncvjAjwwIrMI2PidJSyDUhSQ/KtvsHD01UQHuLYYXTHOVIgDLR3yOyUACLv9Jky
	HkWtgOXe/4F7SsnJ4n4mf2ug4euJG2Q3CHZatqbN8iqgGFVDVBHQWsWilKCNTDevMyzknya71Oy
	YLhz5rwmORb8YM3sJ5sfNukW8yy3hPlS0dxqp/npvoRRYL2o38u8A2tZb4o3Ri6ssHFVspUfB4N
	oTnrb8H11lNh3wGyT6K486tPmiBqU9MEAHnS06ZiVpbP60si3/4cIVx0t59HJJlT39eppeZO8Ms
	UvTyszkc8hHiujFVSasSe9izbgVrTvLx94cEunN/qFkNbwv+fqg9zkH4gU8eUUQ5IEEzWc8WKdC
	N
X-Google-Smtp-Source: AGHT+IFgDkddwXvqOqqSJT1CZMX1d6GgHBVAgSEHYeaDeXxa6mY3F1a1+xVt3mw4tVlYEy5aUmEcVg==
X-Received: by 2002:a5d:64ab:0:b0:3a1:f635:1133 with SMTP id ffacd0b85a97d-3a1f64220b7mr10415587f8f.7.1747042527433;
        Mon, 12 May 2025 02:35:27 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df501sm117524455e9.12.2025.05.12.02.35.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 May 2025 02:35:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: Odroid n2+ usb broken on reboot
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CANAwSgRvtgsejhsj=TyRAYWdQRfGRigvw9+=HzcdxbDopoiFYw@mail.gmail.com>
Date: Mon, 12 May 2025 13:35:13 +0400
Cc: Wayne Schroeder <raz@chewies.net>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@lists.denx.de,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Message-Id: <7BAB0A37-3DA8-4FC9-AFFE-7CAE6FA92367@gmail.com>
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org>
 <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
 <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org>
 <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
 <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
 <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com>
 <CAEUiLuY2D_CzkEH0+gCvkbC_MtJ4B-MLYYkx_r2E9BHxPvuVjg@mail.gmail.com>
 <CANAwSgRvtgsejhsj=TyRAYWdQRfGRigvw9+=HzcdxbDopoiFYw@mail.gmail.com>
To: u-boot-amlogic@groups.io,
 linux.amoon@gmail.com
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_023529_919537_07C49C81 
X-CRM114-Status: GOOD (  29.07  )
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

PiBPbiAxMiBNYXkgMjAyNSwgYXQgMTA6NTnigK9hbSwgQW5hbmQgTW9vbiB2aWEgZ3JvdXBzLmlv
IDxsaW51eC5hbW9vbj1nbWFpbC5jb21AZ3JvdXBzLmlvPiB3cm90ZToKPiAKPiBIaSBXYXluZSwK
PiAKPiBPbiBTdW4sIDExIE1heSAyMDI1IGF0IDAxOjUxLCBXYXluZSBTY2hyb2VkZXIgPHJhekBj
aGV3aWVzLm5ldD4gd3JvdGU6Cj4+IAo+PiBBcHBsaWVkIHBhdGNoZXMgdG8gMjAyNS4wNCByZWxl
YXNlIChhcHBsaWVkIGNsZWFuKS4gIE1hZGUgc3RvY2sKPj4gZGVmY29uZmlnIGZvciBvZHJvaWQg
bjIsIGJ1aWx0LCBzaWduZWQsIGluc3RhbGxlZC4gIFRoZSByZWJvb3QgaXNzdWUKPj4gcmVtYWlu
cyBhbmQgdXNiIHBvcnRzIGFyZSB1bmF2YWlsYWJsZSB0byBsaW51eCBrZXJuZWwgYWZ0ZXIgcmVi
b290Lgo+PiAKPj4gSXQgaXMgd29ydGggbm90aW5nIHRoYXQgbGludXggZG9lcyBzZWUgc29tZSBl
bnVtZXJhdGlvbiBvZiBkZXZpY2VzCj4+IGFmdGVyIGEgd2hpbGUsIGJ1dCBldmVuIGlmIGl0IGxv
Z3MgdG8gdGhlIGNvbnNvbGUgYWJvdXQgZGV2aWNlCj4+IGF0dGFjaG1lbnQsIHRoZSBkZXZpY2Vz
IGRvbid0IGFjdHVhbGx5IGZ1bmN0aW9uLiAgVGhpcyB3YXMgdGhlIHNhbWUKPj4gYmVoYXZpb3Ig
d2l0aCB0aGUgcmVsZWFzZSB2ZXJzaW9uLgo+PiAKPiBUaGFua3MgZm9yIHRlc3RpbmcgdGhlc2Ug
cGF0Y2hlcy4KPiBXZSBuZWVkIHRvIG1vZGlmeSB0aGUgYm9vdCBvcmRlciB0byBwcm9iZSBVU0Ig
YmVmb3JlIE1NQwoKV2h5PyBNb3N0IEFtbG9naWMgYm9hcmRzIGJvb3QgZnJvbSBhbiBtbWMgZGV2
aWNlIChTRCBvciBpbnRlcm5hbCBmbGFzaApzdG9yYWdlKSBub3QgVVNCLiBJdCBzbWVsbHMgbGlr
ZSBhIHdvcmthcm91bmQgbm90IGEgZml4LCBhbmQgSSB3b25kZXIKd2hhdCB0aGUgcGVyZm9ybWFu
Y2UgaW1wYWN0IG9uIGJvb3Qgd2lsbCBiZT8KCkNocmlzdGlhbgoKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9jb25maWdzL21lc29uNjQuaCBiL2luY2x1ZGUvY29uZmlncy9tZXNvbjY0LmgKPiBpbmRl
eCBmMzI3NWIzN2E1MS4uM2FjZTU5ODgwYmQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9jb25maWdz
L21lc29uNjQuaAo+ICsrKyBiL2luY2x1ZGUvY29uZmlncy9tZXNvbjY0LmgKPiBAQCAtMTE5LDgg
KzExOSw4IEBACj4gI2RlZmluZSBCT09UX1RBUkdFVF9ERVZJQ0VTKGZ1bmMpIFwKPiAgICAgICAg
ZnVuYyhST01VU0IsIHJvbXVzYiwgbmEpICBcCj4gICAgICAgIGZ1bmMoVVNCX0RGVSwgdXNiZGZ1
LCBuYSkgIFwKPiAtICAgICAgIEJPT1RfVEFSR0VUX01NQyhmdW5jKSBcCj4gICAgICAgIEJPT1Rf
VEFSR0VUX0RFVklDRVNfVVNCKGZ1bmMpIFwKPiArICAgICAgIEJPT1RfVEFSR0VUX01NQyhmdW5j
KSBcCj4gICAgICAgIEJPT1RfVEFSR0VUX05WTUUoZnVuYykgXAo+ICAgICAgICBCT09UX1RBUkdF
VF9TQ1NJKGZ1bmMpIFwKPiAgICAgICAgQk9PVF9UQVJHRVRfUFhFKGZ1bmMpIFwKPiAKPiBIZXJl
IGlzIHRoZSBib290IHNlcXVlbmNlIGF0IG15IGVuZC4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBVLUJvb3QgMjAyNS4wNy1yYzEtMDAyMjMtZzcwNGE0ZDFmZDgwNCAoTWF5IDEyIDIwMjUg
LSAxMjoxNToyOSArMDUzMCkKPiBvZHJvaWQtbjIvbjItcGx1cwo+IAo+IE1vZGVsOiBIYXJka2Vy
bmVsIE9EUk9JRC1OMgo+IFNvQzogICBBbWxvZ2ljIE1lc29uIEcxMkIgKFM5MjJYKSBSZXZpc2lv
biAyOTpjICg0MDoyKQo+IERSQU06ICAxIEdpQiAodG90YWwgMy44IEdpQikKPiBDb3JlOiAgNDAy
IGRldmljZXMsIDMwIHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBzZXBhcmF0ZQo+IE1NQzogICBtbWNA
ZmZlMDUwMDA6IDAsIG1tY0BmZmUwNzAwMDogMQo+IExvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBu
b3doZXJlLi4uIE9LCj4gSW46ICAgIHVzYmtiZCxzZXJpYWwKPiBPdXQ6ICAgdmlkY29uc29sZSxz
ZXJpYWwKPiBFcnI6ICAgdmlkY29uc29sZSxzZXJpYWwKPiBCb2FyZCB2YXJpYW50OiBuMi1wbHVz
Cj4gTmV0OiAgIGV0aDA6IGV0aGVybmV0QGZmM2YwMDAwCj4gCj4gSGl0IGFueSBrZXkgdG8gc3Rv
cCBhdXRvYm9vdDogIDAKPiBzdGFydGluZyBVU0IuLi4KPiBSZWdpc3RlciAzMDAwMTQwIE5iclBv
cnRzIDMKPiBTdGFydGluZyB0aGUgY29udHJvbGxlcgo+IFVTQiBYSENJIDEuMTAKPiBCdXMgdXNi
QGZmNTAwMDAwOiA0IFVTQiBEZXZpY2UocykgZm91bmQKPiAgICAgICBzY2FubmluZyB1c2IgZm9y
IHN0b3JhZ2UgZGV2aWNlcy4uLiAxIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5kCj4gCj4gRGV2aWNl
IDA6IFZlbmRvcjogQVNNVCAgICAgUmV2OiAwICAgIFByb2Q6IDIxMTUKPiAgICAgICAgICAgIFR5
cGU6IEhhcmQgRGlzawo+ICAgICAgICAgICAgQ2FwYWNpdHk6IDExNDQ3My40IE1CID0gMTExLjcg
R0IgKDIzNDQ0MTY0OCB4IDUxMikKPiAuLi4gaXMgbm93IGN1cnJlbnQgZGV2aWNlCj4gU2Nhbm5p
bmcgdXNiIDA6MS4uLgo+IENhcmQgZGlkIG5vdCByZXNwb25kIHRvIHZvbHRhZ2Ugc2VsZWN0ISA6
IC0xMTAKPiBDYW5ub3QgcGVyc2lzdCBFRkkgdmFyaWFibGVzIHdpdGhvdXQgc3lzdGVtIHBhcnRp
dGlvbgo+IExvYWRpbmcgQm9vdDAwMDAgJ21tYyAxJyBmYWlsZWQKPiBMb2FkaW5nIEJvb3QwMDAx
ICd1c2IgMCcgZmFpbGVkCj4gRUZJIGJvb3QgbWFuYWdlcjogQ2Fubm90IGxvYWQgYW55IGltYWdl
Cj4gQ2FyZCBkaWQgbm90IHJlc3BvbmQgdG8gdm9sdGFnZSBzZWxlY3QhIDogLTExMAo+IHN3aXRj
aCB0byBwYXJ0aXRpb25zICMwLCBPSwo+IG1tYzEocGFydCAwKSBpcyBjdXJyZW50IGRldmljZQo+
IFNjYW5uaW5nIG1tYyAxOjEuLi4KPiBGb3VuZCAvZXh0bGludXgvZXh0bGludXguY29uZgo+IFJl
dHJpZXZpbmcgZmlsZTogL2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKPiAxOiAgICAgIE1hbmphcm8g
QVJNCj4gUmV0cmlldmluZyBmaWxlOiAvSW1hZ2UKPiBSZXRyaWV2aW5nIGZpbGU6IC9pbml0cmFt
ZnMtbGludXguaW1nCj4gYXBwZW5kOiBpbml0cmQ9L2luaXRyYW1mcy1saW51eC5pbWcgY29uc29s
ZT10dHlBTUwwLDExNTIwMG44Cj4gcm9vdD1QQVJUVVVJRD0wZWZjN2MzNi0wMiByb290d2FpdCBh
dWRpdD0wIGNsa19pZ25vcmVfdW51c2VkCj4gcGx5bW91dGguaWdub3JlLXNlcmlhbC1jb25zb2xl
cwo+IAo+PiBXYXluZQo+PiAKPj4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAxMDowMeKAr0FNIFdh
eW5lIFNjaHJvZWRlciA8cmF6QGNoZXdpZXMubmV0PiB3cm90ZToKPj4+IAo+Pj4gWWVzLiAgV2ls
bCByZXBvcnQgYmFjayBob3cgaXQgd29ya3Mgb24gdGhlIG4yKy4KPj4+IAo+Pj4gCj4+PiBPbiBG
cmksIE1heSA5LCAyMDI1IGF0IDI6MDjigK9BTSBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFp
bC5jb20+IHdyb3RlOgo+Pj4+IAo+Pj4+IEhpIFdheW5lLAo+Pj4+IAo+Pj4+IE9uIEZyaSwgOSBN
YXkgMjAyNSBhdCAwMToyNSwgV2F5bmUgU2Nocm9lZGVyIDxyYXpAY2hld2llcy5uZXQ+IHdyb3Rl
Ogo+Pj4+PiAKPj4+Pj4gSSBhY3R1YWxseSBhbHJlYWR5IGhhdmUgYSB3b3JraW5nIHNvbHV0aW9u
IHRoYXQgSSBkb2N1bWVudGVkIGluIG15Cj4+Pj4+IGdpdGh1YiByZXBvIChkdWJzY2hyby9vZHJv
aWQtbjIpLiAgQWxsIEkgZG8gaXMgc2V0IEJPT1RDT01NQU5EIHRvCj4+Pj4+IGNoZWNrL2RlbGV0
ZSBhIGZsYWcgZmlsZSBvbiBteSBib290IHBhcnRpdGlvbiBhbmQgaWYgaXQgaXMgZm91bmQsIHRo
ZW4KPj4+Pj4gcmVzZXQgdXNiIGFuZCBzbGVlcCBmb3IgMTAgc2Vjb25kcy4gIEkgdGhlbiBoYXZl
IGEgc3lzdGVtZCBzaHV0ZG93bgo+Pj4+PiBzY3JpcHQgb25seSBvbiByZWJvb3QgdG8gdG91Y2gg
dGhhdCBmaWxlLgo+Pj4+PiAKPj4+Pj4gQ09ORklHX0JPT1RDT01NQU5EPSJmYXRybSBtbWMgMDox
IHJlYm9vdCAmJiBlY2hvIFJlc2V0dGluZyBVU0Igb24KPj4+Pj4gcmVib290Li4uICYmIHVzYiBy
ZXNldCAmJiBzbGVlcCAxMDsgcnVuIGRpc3Ryb19ib290Y21kIgo+Pj4+PiAKPj4+Pj4gSXQgaXMg
YSBoYWNrLCBidXQuLi4gdGhlIHN5c3RlbSByZWxpYWJseSByZWJvb3RzIHJlbW90ZWx5IG5vdywg
YW5kCj4+Pj4+IHRoYXQncyB0aGUgaW1wb3J0YW50IHBhcnQgZm9yIG5vdy4KPj4+Pj4gCj4+Pj4+
IFdheW5lCj4gSSBkaWQgbm90IG1vZGlmeSB0aGlzIGF0IG15IGVuZC4gSG93ZXZlciwgdGhpcyBp
cyBub3QgcmVxdWlyZWQgd2l0aAo+IHRoZSBhYm92ZSBmaXguCj4gCj4gVGhhbmtzCj4gLUFuYW5k
Cj4+Pj4+IAo+Pj4+PiBPbiBUaHUsIE1heSA4LCAyMDI1IGF0IDExOjIy4oCvQU0gRmVyYXNzIEVs
IEhhZmlkaQo+Pj4+PiA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4gd3JvdGU6Cj4+Pj4+
PiAKPj4+Pj4+IE9uIFdlZCBNYXkgNywgMjAyNSBhdCAxOjAzIFBNIFVUQywgV2F5bmUgU2Nocm9l
ZGVyIHdyb3RlOgo+Pj4+Pj4+IEl0J3MgaGFyZCBmb3IgbWUgdG8gcXVhbnRpZnkgaWYgdXNiIHdv
cmtzIGluIHUtYm9vdCBhcyBJJ20gbm90IGxvYWRpbmcKPj4+Pj4+PiBvZmYgb2YgYW55IHVzYiBz
dG9yYWdlIGRldmljZXMuICBJdCBjZXJ0YWlubHkgbmV2ZXIgbGV0cyBtZSB1c2UgdGhlCj4+Pj4+
Pj4ga2V5Ym9hcmQgdG8gYWJvcnQgYXV0byBib290LCBhbmQgbmV2ZXIgaGFzLiAgT24gcmVib290
LCB0byByZWxpYWJseQo+Pj4+Pj4gCj4+Pj4+PiBZb3UgY2FuIHNlbmQgYnl0ZXMgdmlhIFVBUlQg
dG8gYWJvcnQgYm9vdCwgaWYgeW91IGhhcHBlbiB0byBoYXZlIGEgVUFSVAo+Pj4+Pj4gYWRhcHRl
ciBhcm91bmQuCj4+Pj4+IAo+Pj4+IENhbiB5b3UgdGVzdCB0aGlzIHNlcmllcyB0byBzZWUgaWYg
dGhpcyByZXNvbHZlcyB0aGUgaXNzdWU/Cj4+Pj4gCj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L3Vib290L2xpc3QvP3Nlcmllcz00NTYwODgKPj4+PiAKPj4+PiBUaGFu
a3MKPj4+PiAtQW5hbmQKPj4+PiAKPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+Pj4g
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+IAo+IAo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tCj4gR3JvdXBzLmlvIExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2Fn
ZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjMjY5Nik6IGh0dHBz
Oi8vZ3JvdXBzLmlvL2cvdS1ib290LWFtbG9naWMvbWVzc2FnZS8yNjk2Cj4gTXV0ZSBUaGlzIFRv
cGljOiBodHRwczovL2dyb3Vwcy5pby9tdC8xMTI2MjU0MzUvNjQwNzMyMwo+IEdyb3VwIE93bmVy
OiB1LWJvb3QtYW1sb2dpYytvd25lckBncm91cHMuaW8KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9n
cm91cHMuaW8vZy91LWJvb3QtYW1sb2dpYy91bnN1YiBbY2hyaXN0aWFuc2hld2l0dEBnbWFpbC5j
b21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
