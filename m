Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64FCC7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi5o6rhH0uoDabNdu2Na12w6pefftI2e1heYASdTIcs=; b=geS5egFmBFjIkp
	Dvq5KmK/6anu/leSjIf0ovFY6vYs36EXmVBjyEGimCcjgW2uPZjEE6VxeSHihjLl7qaS7QkuOB0ck
	vGgDnPjKDSoshrpkNgG0d2E4LW21h5jP+dxmvbhj3jA21UnPTTKRLc/+f5sGNcVOE5Kr7for2kmDN
	UwiKnkX0ATR+1SPR1M7EenVuRMuy8Qxh5n2o9+yBHWByCUfXGvDJDAiMlFHw4ZHReMSAaHG0OF6LW
	+uEYzHhmq+hmbrh+gSmmpXIVGrZVQKeGqe9tnZcu1tP+EZFvEJRt+tgycvhyve/Pk08bisU4Ce8x6
	C5hn4kvAeGwK40p1u7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiNW-004TWQ-2S;
	Wed, 12 Apr 2023 21:51:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmiNT-004TSP-0C;
	Wed, 12 Apr 2023 21:51:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e22so12216146wra.6;
        Wed, 12 Apr 2023 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681336295; x=1683928295;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym52jQCPNqJCSId057dBztHUHrCsma88sgI3he60CTI=;
        b=OgthBYRKtfnqJEEoEkfgB1IYjWnjUO7e5EgHK7DKwgF0fSlD48ByaTdrXouOhCBsWX
         XEXMSmkCbj8r64jnU2bsr1EZbFOntmy4wwX6zDGsM1gyY9SxXkIasmH9bbdnYMekQoSC
         iZigIwguiSA0CLFOzgmoB4jqSdbWvIVPGLcIyPt0Z6O2i8izOf1jwOQ85DJq1Oc8M33R
         M/wNNSAASPuJ3cat45tgrLZhTVEfTtPByoiMI26JajjiFoppltE4AXprU10pMJ8Bw1kD
         dmNnteuMoKaZ9NCpJuakzPSpzsFYgOpZBHLYi7bcblD0GRakcPZg+c15A7z9rXZsOw3a
         f6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681336295; x=1683928295;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym52jQCPNqJCSId057dBztHUHrCsma88sgI3he60CTI=;
        b=QxSsyGyAJYl0Cz7rh9CVTrQDeb34bPhm1hnDIYGCuNyirv2jLyziuPVVYC+43/QW1r
         bgBMuy801l97sJG4g/g3j61k7MBCUCCRG2FbSfWmZtwWIZlEYmZgtlRtFY/Y9N1EJlbi
         B6xceAVMWA000sVveum6bNKDKs7yBrlG79EeUOnlazzsrZoN/KhEWu4Tq8/OZ44SNN+h
         GBDlBLsufEPAF+fHidtbGlucCouzu8E9LB55Hxlk/ecZe0wGPlDm8ErfG8d0FCCTRAdB
         aEkNwk7c8zCWi9iwZ6jNLbCbXZKzCMrWoiVWW9FcAL3ecQwA0bHGm4d9eRgNUl+u0vIz
         DXQQ==
X-Gm-Message-State: AAQBX9dK7wETgbgg58SS5CxeV6dfFO28inGYfvx4TpWvd7LYdIHqTuVo
	5fr7ecm3IdrZwD+iWy0ZaVo=
X-Google-Smtp-Source: AKy350bEHRko6Jy1RmF/saLkGukHWHGUkk6YNNTTBkWjBqb+i5X4bRuwzGbjTgoR678oaHiwqxjkMA==
X-Received: by 2002:a05:6000:11c1:b0:2f4:48c9:495f with SMTP id i1-20020a05600011c100b002f448c9495fmr2786464wrx.48.1681336295039;
        Wed, 12 Apr 2023 14:51:35 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:b0e7:6bd7:f613:784b? (dynamic-2a02-3100-903d-3d00-b0e7-6bd7-f613-784b.310.pool.telefonica.de. [2a02:3100:903d:3d00:b0e7:6bd7:f613:784b])
        by smtp.googlemail.com with ESMTPSA id iv8-20020a05600c548800b003f09e294d5esm3450301wmb.6.2023.04.12.14.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 14:51:34 -0700 (PDT)
Message-ID: <0dcc6c3a-5a77-68a0-e115-f28ad5f44496@gmail.com>
Date: Wed, 12 Apr 2023 23:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
 <12d4fbc1-8ed4-637e-32ca-2c09d25d60a6@gmail.com>
 <CAFBinCDME3=3dUx6K5iZHcr=tu6nh-Xm2NMn_VAiTcM_uZD_qQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 4/4] pwm: meson: make full use of common clock
 framework
In-Reply-To: <CAFBinCDME3=3dUx6K5iZHcr=tu6nh-Xm2NMn_VAiTcM_uZD_qQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_145143_098312_D6CEBBB5 
X-CRM114-Status: GOOD (  32.57  )
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

T24gMTIuMDQuMjAyMyAyMzowNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBIZWlu
ZXIsCj4gCj4gT24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgOToyM+KAr1BNIEhlaW5lciBLYWxsd2Vp
dCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBOZXdlciB2ZXJzaW9ucyBvZiB0
aGUgUFdNIGJsb2NrIHVzZSBhIGNvcmUgY2xvY2sgd2l0aCBleHRlcm5hbCBtdXgsCj4+IGRpdmlk
ZXIsIGFuZCBnYXRlLiBUaGVzZSBjb21wb25lbnRzIGVpdGhlciBkb24ndCBleGlzdCBhbnkgbG9u
Z2VyIGluCj4+IHRoZSBQV00gYmxvY2ssIG9yIHRoZXkgYXJlIGJ5cGFzc2VkLgo+PiBUbyBtaW5p
bWl6ZSBuZWVkZWQgY2hhbmdlcyBmb3Igc3VwcG9ydGluZyB0aGUgbmV3IHZlcnNpb24sIHRoZSBp
bnRlcm5hbAo+PiBkaXZpZGVyIGFuZCBnYXRlIHNob3VsZCBiZSBoYW5kbGVkIGJ5IENDRiB0b28u
Cj4+Cj4+IEkgZGlkbid0IHNlZSBhIGdvb2Qgd2F5IHRvIHNwbGl0IHRoZSBwYXRjaCwgdGhlcmVm
b3JlIGl0J3Mgc29tZXdoYXQKPj4gYmlnZ2VyLiBXaGF0IGl0IGRvZXM6Cj4+Cj4+IC0gVGhlIGlu
dGVybmFsIG11eCBpcyBoYW5kbGVkIGJ5IENDRiBhbHJlYWR5LiBSZWdpc3RlciBhbHNvIGludGVy
bmFsCj4+ICAgZGl2aWRlciBhbmQgZ2F0ZSB3aXRoIENDRiwgc28gdGhhdCB3ZSBoYXZlIG9uZSBy
ZXByZXNlbnRhdGlvbiBvZiB0aGUKPj4gICBpbnB1dCBjbG9jazogW211eF0gcGFyZW50IG9mIFtk
aXZpZGVyXSBwYXJlbnQgb2YgW2dhdGVdCj4+Cj4+IC0gTm93IHRoYXQgQ0NGIHNlbGVjdHMgYW4g
YXBwcm9wcmlhdGUgbXV4IHBhcmVudCwgd2UgZG9uJ3QgbmVlZCB0aGUKPj4gICBEVC1wcm92aWRl
ZCBkZWZhdWx0IHBhcmVudCBhbnkgbG9uZ2VyLiBBY2NvcmRpbmdseSB3ZSBjYW4gYWxzbyBvbWl0
Cj4+ICAgc2V0dGluZyB0aGUgbXV4IHBhcmVudCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyLgo+Pgo+
PiAtIEluc3RlYWQgb2YgbWFudWFsbHkgaGFuZGxpbmcgdGhlIHByZS1kaXYgZGl2aWRlciB2YWx1
ZSwgbGV0IENDRgo+PiAgIHNldCB0aGUgaW5wdXQgY2xvY2suIFRhcmdldGVkIGlucHV0IGNsb2Nr
IGZyZXF1ZW5jeSBpcwo+PiAgIDB4ZmZmZiAqIDEvcGVyaW9kIGZvciBiZXN0IHByZWNpc2lvbi4K
Pj4KPj4gLSBGb3IgdGhlICJpbnZlcnRlZCBwd20gZGlzYWJsZWQiIHNjZW5hcmlvIHRhcmdldCBh
biBpbnB1dCBjbG9jawo+PiAgIGZyZXF1ZW5jeSBvZiAxR0h6LiBUaGlzIGVuc3VyZXMgdGhhdCB0
aGUgcmVtYWluaW5nIGxvdyBwdWxzZXMKPj4gICBoYXZlIG1pbmltdW0gbGVuZ3RoLgo+Pgo+PiBJ
IGRvbid0IGhhdmUgaHcgd2l0aCB0aGUgb2xkIFBXTSBibG9jaywgdGhlcmVmb3JlIEkgY291bGRu
J3QgdGVzdCB0aGlzCj4+IHBhdGNoLiBXaXRoIHRoZSBub3QgeWV0IGluY2x1ZGVkIGV4dGVuc2lv
biBmb3IgdGhlIG5ldyBQV00gYmxvY2sKPj4gKGNoYW5uZWwtPmNsb2NrIGRpcmVjdGx5IGNvbWlu
ZyBmcm9tIGdldF9jbGsoZXh0ZXJuYWxfY2xrKSkgSSBkaWRuJ3QKPj4gbm90aWNlIGFueSBwcm9i
bGVtLiBNeSBzeXN0ZW0gdXNlcyBQV00gZm9yIHRoZSBDUFUgdm9sdGFnZSByZWd1bGF0b3IKPj4g
YW5kIGZvciB0aGUgU0RJTyAzMmtIeiBjbG9jay4KPj4KPj4gTm90ZTogVGhlIGNsb2NrIGdhdGUg
aW4gdGhlIG9sZCBQV00gYmxvY2sgaXMgcGVybWFuZW50bHkgZGlzYWJsZWQuCj4+IFRoaXMgc2Vl
bXMgdG8gaW5kaWNhdGUgdGhhdCBpdCdzIG5vdCB1c2VkIGJ5IHRoZSBuZXcgUFdNIGJsb2NrLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29t
Pgo+IFRlc3RlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4gIwo+IG1lc29uOGItb2Ryb2lkYzEsIHNtMS14OTYtYWlyCj4gCj4gR2Vu
ZXJhbGx5IEknbSB2ZXJ5IGhhcHB5IHdpdGggdGhpcyAtIG9ubHkgYSBmZXcgc21hbGwgcXVlc3Rp
b25zL2NvbW1lbnRzIGJlbG93Lgo+IAo+IFsuLi5dCj4+ICsgICAgICAgc3RhdGUtPmVuYWJsZWQg
PSBfX2Nsa19pc19lbmFibGVkKGNoYW5uZWwtPmNsaykgJiYgKHZhbHVlICYgdG1wKSA9PSB0bXA7
Cj4gSSB3YXMgYWJvdXQgdG8gc3VnZ2VzdCB0aGF0IGNsa19od19pc19lbmFibGVkKCkgc2hvdWxk
IGJlIHVzZWQgaW5zdGVhZAo+IG9mIF9fY2xrX2lzX2VuYWJsZWQoKQo+IFRoYXQgd291bGQgYmUg
ZWFzeSBmb3IgU29DcyB3aGVyZSB0aGUgZ2F0ZSBpcyBwYXJ0IG9mIHRoZSBQV00gSVAuIEJ1dAo+
IGl0IHdvdWxkIG5vdCB3b3JrIChhdCBsZWFzdCBJIGRvbid0IHRoaW5rIHRoYXQgaXQgd291bGQp
IHdvcmsgZm9yIHRoZQo+IG5ld2VyIElQIHRoYXQgSGVpbmVyJ3MgZGVzY3JpYmVkIHdoZXJlIHRo
ZSBnYXRlIGlzIHBhcnQgb2YgdGhlIFNvQydzCj4gY2xvY2sgY29udHJvbGxlciAoYW5kIHRodXMg
b3V0c2lkZSB0aGUgUFdNIGNvbnRyb2xsZXIgcmVnaXN0ZXJzKS4gVG8KPiBtZSB0aGlzIG1lYW5z
IHRoYXQgd2UgbmVlZCB0byBrZWVwIF9fY2xrX2lzX2VuYWJsZWQoKSBoZXJlIHVubGVzcwo+IHNv
bWVib2R5IGtub3dzIG9mIGEgYmV0dGVyIGFwcHJvYWNoLgo+IAo+IFRoZSAiKHZhbHVlICYgdG1w
KSA9PSB0bXAiIGNhbiBub3cgYmUgc2ltcGxpZmllZCB0byAhISh2YWx1ZSAmCj4gQklUKGNoYW5u
ZWxfZGF0YS0+cHdtX2VuX2JpdCkpIGFzIHdlJ3JlIG5vdyBvbmx5IGNoZWNraW5nIGEgc2luZ2xl
IGJpdAo+IChwcmV2aW91c2x5IHdlIHdlcmUgY2hlY2tpbmcgdHdvIGJpdHMgaW4gb25lIHN0YXRl
bWVudCwgc28gdGhhdCBtb3JlCj4gY29tcGxleCBjaGVjayB3YXMgbmVlZGVkKS4KPiAKSWYgYWNj
ZXB0YWJsZSB0aGlzIGNvdWxkIGJlIGRvbmUgYXMgYSBmb2xsb3ctdXAgcGF0Y2guCgo+IFsuLi5d
Cj4+ICsgICAgICAgICAgICAgICBjaGFubmVsLT5nYXRlLnJlZyA9IG1lc29uLT5iYXNlICsgUkVH
X01JU0NfQUI7Cj4+ICsgICAgICAgICAgICAgICBjaGFubmVsLT5nYXRlLmJpdF9pZHggPSBtZXNv
bl9wd21fcGVyX2NoYW5uZWxfZGF0YVtpXS5jbGtfZW5fYml0Owo+PiArICAgICAgICAgICAgICAg
Y2hhbm5lbC0+Z2F0ZS5ody5pbml0ID0gJmluaXQ7Cj4+ICsgICAgICAgICAgICAgICBjaGFubmVs
LT5nYXRlLmZsYWdzID0gMDsKPj4gKyAgICAgICAgICAgICAgIGNoYW5uZWwtPmdhdGUubG9jayA9
ICZtZXNvbi0+bG9jazsKPj4gKwo+PiArICAgICAgICAgICAgICAgY2hhbm5lbC0+Y2xrID0gZGV2
bV9jbGtfcmVnaXN0ZXIoZGV2LCAmY2hhbm5lbC0+Z2F0ZS5odyk7Cj4gSWYgSSByZWNhbGwgY29y
cmVjdGx5IEplcm9tZSBwcmV2aW91c2x5IHN1Z2dlc3RlZCB0aGF0IEkgc2hvdWxkIHVzZToKPiAt
IGRldm1fY2xrX2h3X3JlZ2lzdGVyKCkgdG8gaW5pdGlhbGx5IHJlZ2lzdGVyIHRoZSBjbG9jawo+
IC0gdGhlbiB1c2UgKGZvciBleGFtcGxlKSBjaGFubmVsLT5jbGsgPSBkZXZtX2Nsa19od19nZXRf
Y2xrKGRldiwKPiAmY2hhbm5lbC0+Z2F0ZS5odywgInB3bTAiKQo+IAo+IEl0J3Mgbm90IHRoZSBt
b3N0IGNvbW1vbiBwYXR0ZXJuICh5ZXQpIGJ1dCBpZiBJIHJlY2FsbCBjb3JyZWN0bHkgdGhpcwo+
IGlzIGFsc28gd2hhdCB0aGUgQ0NGIG1haW50YWluZXJzIGFncmVlZCB0byBiZSB0aGUgd2F5IGZv
cndhcmQuCj4gCkFzIG9mIHRvZGF5IHRoaXMgcGF0dGVybiBqdXN0IGNyZWF0ZXMgb3ZlcmhlYWQg
YmVjYXVzZSBjbGtfaHdfcmVnaXN0ZXIoKQpidWlsZHMgb24gdG9wIG9mIF9fY2xrX3JlZ2lzdGVy
KCkgYW5kIHRoZXJlZm9yZSBjcmVhdGVzIGEgY29uc3VtZXIsCmFuZCBkZXZtX2Nsa19od19nZXRf
Y2xrKCkgY3JlYXRlcyBhIHNlY29uZCBjb25zdW1lci4gQnV0IEkgc2VlIHRoZSBwb2ludC4KClNp
dHVhdGlvbiBtYXkgY2hhbmdlIG9uY2UgY2xrX2h3X3JlZ2lzdGVyKCkgaXMgcmUtaW1wbGVtZW50
ZWQgYW5kIGRvZXNuJ3QKY3JlYXRlIGEgY29uc3VtZXIgYW55IGxvbmdlci4KCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IE1hcnRpbgoKSGVpbmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
