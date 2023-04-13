Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C474C77B6C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3g7AfLpJbYW5od8Q3kfme3/e2xp5GtOZpBWG/z7ouY=; b=LIXrYhzzoEV4/T
	VlwSfJHmtQswpEu2Ohmz+gQJhVH4HiH9KFcBU42jY3+Aq1l5BqMfUBZKf86itjSnyxBWCCKhVsxiX
	IwoeDS2CachYLlxZym2DZUVqWV/pcPlfs6cegG+4ncmE3ysJWmNpKuoWXvlmLUdLYxu9saSACGhoH
	REsbCwGTLOxGzpm+D8rZ1ZPahHvIChqgf5I083euQIC+rkh/JqptFGD1k6cPUh/zl/GKzsB/AF+pu
	jY4Ruz1FxDCxwQkoVu9VnYttjkqk9xYXpgS68UIcn/pW2fY1eHkinZx3wKYTz1B61r+LHbScDwG5O
	kjBeECSCFW7KAYQ8E7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqBi-0058SG-26;
	Thu, 13 Apr 2023 06:12:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqBf-0058PM-00;
	Thu, 13 Apr 2023 06:12:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so5674257wmb.3;
        Wed, 12 Apr 2023 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681366318; x=1683958318;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awOm9muSY38mDgU9YNhlhDcoLFSx4493kH/RGeG3QLA=;
        b=Lh/ncrEBpXTUpaccGXNfGHsXix7yWcntwG084k9e5GjA45WCjfU7gD1bdGYuX1Q1Me
         /NerKj4eJgD+47lsCS52i80X1kLndjrbLQs5c2it8RpWvtNYPHXTlsPGP7je1xu23p82
         BeHh2CdVICQz0u0kT0eiu6XoITcys/TUdjGeR4YDBynj560ib8vriCS2htv3mJWNjEs7
         gNuFMDbR6xceaIjT1M8HxkDkBxXOIM8qQx6vCM0zUi4Mb34wXsSR/zTARO54Tf/iVm/y
         PTpcndwh/WVyHL6nBvPp9VpCnRO6WFp72cXYlBStzkeGHcX6vKY6d2LkrRodxPCX52PF
         YhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681366318; x=1683958318;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awOm9muSY38mDgU9YNhlhDcoLFSx4493kH/RGeG3QLA=;
        b=ZnTilS8ysfWxa2VJCU5CVvkHl++ghSqpTirxUALBHeMSRBLcgP4WBdqcRCO9fSTbFo
         n8vF0/Q1HCxwed12ZwUVj3/wk+/xUebTEeli/PjSigBRnQ3HqBjyfhJL5mavD/xM0trF
         j28Kwu8LiJMG9VOZitABw/mqFAbQWu+22cBe3ih9Hpv1vNREyPpHiEJIyWHyhpR2uGtF
         omjSB8RaDwXoLS9s//tnPqLyImbyBtKuxMb1rOt5CN3WzJXwLqwhebrbcRLfsx0zzKH4
         L6cPUOSFEcxTh/BXMGi+LtdPRcG8x/xrXjskbNqAfKrQSAg8LeYOmoCIyKnsJ915ltuV
         5mbg==
X-Gm-Message-State: AAQBX9eUzhB5jj+0/UX08KPQhpFraHBquOkcd31KwzjGWyRgHl8Hb82m
	ap1pjO3PbRlHUsxGhU7/8NQ=
X-Google-Smtp-Source: AKy350ZZtYeOpLr4TXMpC/6XFO5t2jSa5vvndPYNxpSRFPZMMtr3r9fvyXO/3/JqvwteOd2ONcfeEA==
X-Received: by 2002:a7b:c40a:0:b0:3dc:4b87:a570 with SMTP id k10-20020a7bc40a000000b003dc4b87a570mr443880wmi.35.1681366318162;
        Wed, 12 Apr 2023 23:11:58 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8? (dynamic-2a01-0c22-738e-4400-9dd0-adc5-d6d8-61d8.c22.pool.telefonica.de. [2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8])
        by smtp.googlemail.com with ESMTPSA id c8-20020a05600c0a4800b003ee5fa61f45sm4535912wmq.3.2023.04.12.23.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 23:11:57 -0700 (PDT)
Message-ID: <b32bf46e-432f-22f0-63fd-123853d787e5@gmail.com>
Date: Thu, 13 Apr 2023 08:11:51 +0200
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
X-CRM114-CacheID: sfid-20230412_231203_038799_37D8E07F 
X-CRM114-Status: GOOD (  32.51  )
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
bWVudCwgc28gdGhhdCBtb3JlCj4gY29tcGxleCBjaGVjayB3YXMgbmVlZGVkKS4KPiAKPiBbLi4u
XQo+PiArICAgICAgICAgICAgICAgY2hhbm5lbC0+Z2F0ZS5yZWcgPSBtZXNvbi0+YmFzZSArIFJF
R19NSVNDX0FCOwo+PiArICAgICAgICAgICAgICAgY2hhbm5lbC0+Z2F0ZS5iaXRfaWR4ID0gbWVz
b25fcHdtX3Blcl9jaGFubmVsX2RhdGFbaV0uY2xrX2VuX2JpdDsKPj4gKyAgICAgICAgICAgICAg
IGNoYW5uZWwtPmdhdGUuaHcuaW5pdCA9ICZpbml0Owo+PiArICAgICAgICAgICAgICAgY2hhbm5l
bC0+Z2F0ZS5mbGFncyA9IDA7Cj4+ICsgICAgICAgICAgICAgICBjaGFubmVsLT5nYXRlLmxvY2sg
PSAmbWVzb24tPmxvY2s7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGNoYW5uZWwtPmNsayA9IGRl
dm1fY2xrX3JlZ2lzdGVyKGRldiwgJmNoYW5uZWwtPmdhdGUuaHcpOwo+IElmIEkgcmVjYWxsIGNv
cnJlY3RseSBKZXJvbWUgcHJldmlvdXNseSBzdWdnZXN0ZWQgdGhhdCBJIHNob3VsZCB1c2U6Cj4g
LSBkZXZtX2Nsa19od19yZWdpc3RlcigpIHRvIGluaXRpYWxseSByZWdpc3RlciB0aGUgY2xvY2sK
PiAtIHRoZW4gdXNlIChmb3IgZXhhbXBsZSkgY2hhbm5lbC0+Y2xrID0gZGV2bV9jbGtfaHdfZ2V0
X2NsayhkZXYsCj4gJmNoYW5uZWwtPmdhdGUuaHcsICJwd20wIikKPiAKPiBJdCdzIG5vdCB0aGUg
bW9zdCBjb21tb24gcGF0dGVybiAoeWV0KSBidXQgaWYgSSByZWNhbGwgY29ycmVjdGx5IHRoaXMK
PiBpcyBhbHNvIHdoYXQgdGhlIENDRiBtYWludGFpbmVycyBhZ3JlZWQgdG8gYmUgdGhlIHdheSBm
b3J3YXJkLgo+IApPbmUgbW9yZSByZW1hcmsvcXVlc3Rpb24gb24gdGhpcyBwYXR0ZXJuLiBJbiBf
X2Nsa19yZWdpc3RlcigpIHRoZXJlJ3MKdGhlIGZvbGxvd2luZyBjb21tZW50OgovKgoqIERvbid0
IGNhbGwgY2xrX2h3X2NyZWF0ZV9jbGsoKSBoZXJlIGJlY2F1c2UgdGhhdCB3b3VsZCBwaW4gdGhl
CiogcHJvdmlkZXIgbW9kdWxlIHRvIGl0c2VsZiBhbmQgcHJldmVudCBpdCBmcm9tIGV2ZXIgYmVp
bmcgcmVtb3ZlZC4KKi8KSSB0aGluayB3ZSBoYXZlIHRoZSBzYW1lIHNpdHVhdGlvbiBoZXJlIHdo
ZW4gY2FsbGluZyBkZXZtX2Nsa19od19yZWdpc3RlcigpCmFuZCBkZXZtX2Nsa19od19nZXRfY2xr
KCkgYm90aCBmcm9tIHB3bS1tZXNvbi4gU28gd2UgbWF5IG5vdCBiZSBhYmxlIHRvCnJlbW92ZSBt
b2R1bGUgcHdtLW1lc29uLiBTaG91bGRuJ3QgYmUgcmVhbGx5IHJlbGV2YW50IGZvciB1cyBiZWNh
dXNlIHdlCm5lZWQgcHdtIGZvciB0aGUgQ1BVIHZvbHRhZ2UgcmVndWxhdG9yIGFuZCB0aGVyZWZv
cmUgaGF2ZSBpdCBidWlsdC1pbi4KQnV0IGl0IHdvdWxkbid0IGJlIG5pY2UuCgo+IAo+IEJlc3Qg
cmVnYXJkcywKPiBNYXJ0aW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
