Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43926C54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRVThqAxw7Le9xzn9YhS+5cf4PnyazRY/JYAYLKAlm4=; b=XWPDE86qD1C1Oo
	+HU4jRWAetKyyvWxPetzL6y+1aOlPq6N8UYPCeUtIEtXVEPgGtnAz3k55yNXirghMWmm+CQbaMVUP
	+/Rd7AIvVFA+Icvh3LjyEuMtmnk9vwHIj/RKNddr537SqsJU0iZhNE2MKbjh3UZ9Bse7iOV1ZiUDe
	JXOEzfvRDlyanoE2S0DJ0eDCTepQDbR7HTpxzdNtPkTo4mqk0FShjmRjS87KPoTQORKQKMlz8vHca
	iy+TQ6XXkNNHfEJvzQqwUZAs/hKADTzjQlnnc3XxCDi72xN2TuhxjnLNqOo3okRXHlKLAXJqY6VMQ
	TH+U7qzXmm64XG53qHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEv1K-002aix-RY; Mon, 09 Jan 2023 16:29:10 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEv1I-002ahE-AU
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 16:29:09 +0000
Received: by mail-io1-xd35.google.com with SMTP id h6so4741314iof.9
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 08:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JL+xfPFDnGNKkrm/hubQpHGy0imJ1B9l3Ypqp6ZRadw=;
        b=IzBN2Aa5JriGDuRbHEouaLt6DAEoETbGfA0b26eDZIMGVAO7Q8ZA0Y42bRuk626b6k
         3P30J5kbreBZUXD6pyaRq5CLFosWwww7N1ba5hw9jWS3ntfm5c9pFKWxc2l6KJXsvKzL
         FZ5USJVCVyy6gHw4XeC1kpMV1jLSGhvR/yF60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL+xfPFDnGNKkrm/hubQpHGy0imJ1B9l3Ypqp6ZRadw=;
        b=O04tuAXgS8iKcsNO7mwMzx+r8VMWyg5gdxxykA1OEoacTftRl3Q/QOpJ4N4L8hVU1d
         LKKtEpZlh3pgNBZ6ZmZMdl+XMsr4P+NQ+iH2rYYaHWx+KsiebGbxj+jVEoyOMM14gt3R
         addgZnOzsLXeR6M9JL97h8Rx51QaVCek+8wBqFchXf2U3v5K1vSEgzgE4o/qih89akC1
         RPSWvBqEnqlFn/5Q6GaT/nB8C7eF6Bnnb9AjyD6AgDXN7Rw9whawPXre8TuMdwp0O2aH
         w2G0Hd0tnZKQAUvcbS0yE+FqIyxhrfau+EoU+cVy7Nm5fYE9xN9jqz98lFBdArGKTxBO
         5vMw==
X-Gm-Message-State: AFqh2kqNAKUvOcXZpgr4hQqYleGODKqS2rnL2MOnbOVqPrppOzvbEtGn
	L9R9SSp6gkdM1ySlSKi6uAyJtA==
X-Google-Smtp-Source: AMrXdXt9PFZ9mMVfWJFGUaGpTPudCsDmQkZEa9P+xgmWWs3bsEeuNXrk/uJ9pMkjdqHWeVx7twwD2w==
X-Received: by 2002:a05:6602:2e91:b0:6df:df5b:f86 with SMTP id m17-20020a0566022e9100b006dfdf5b0f86mr65662694iow.8.1673281747269;
        Mon, 09 Jan 2023 08:29:07 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r8-20020a92ac08000000b0030c68d38255sm2748135ilh.38.2023.01.09.08.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 08:29:06 -0800 (PST)
Date: Mon, 9 Jan 2023 16:29:06 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
Message-ID: <Y7xA0nO53cBRetz4@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
 <Y7YDwJX6aqa8vbQK@google.com>
 <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_082908_400447_1DDB959C 
X-CRM114-Status: GOOD (  34.16  )
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

T24gU2F0LCBKYW4gMDcsIDIwMjMgYXQgMDg6MzE6MjNQTSArMDUzMCwgQW5hbmQgTW9vbiB3cm90
ZToKPiBIaSBNYXR0aGlhcywKPiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMKPiAK
PiBPbiBUaHUsIDUgSmFuIDIwMjMgYXQgMDQ6MjUsIE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hy
b21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIERlYyAyOCwgMjAyMiBhdCAwMzo1OTox
N1BNICswNTMwLCBBbmFuZCBNb29uIHdyb3RlOgo+ID4gPiBIaSBJY2Vub3d5LAo+ID4gPgo+ID4g
PiBUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMKPiA+ID4KPiA+ID4gT24gV2VkLCAyOCBE
ZWMgMjAyMiBhdCAxNTozOCwgSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4g5ZyoIDIwMjItMTItMjjmmJ/mnJ/kuInnmoQgMTA6MDMgKzAwMDDvvIxB
bmFuZCBNb29u5YaZ6YGT77yaCj4gPiA+ID4gPiBBZGQgdXNiIGh1YiBkZXZpY2UgaWQgZm9yIEdl
bmVzeXMgTG9naWMsIEluYy4gR0w4NTJHLU9IRyBIdWIgVVNCIDIuMAo+ID4gPiA+ID4gcm9vdCBo
dWIgYW5kIEdlbmVzeXMgTG9naWMsIEluYy4gR0wzNTIzLVFGTjc2IFVTQiAzLjEgcm9vdCBodWIu
Cj4gPgo+ID4gbml0OiBRRk4gNzYgaXMgb25lIG9mIHRoZSBwYWNrYWdlIG9wdGlvbnMgb2YgdGhl
IEdMMzUyMywgSSBleHBlY3QgdGhpcwo+ID4gYmluZGluZyB0byBiZSBhcHBsaWNhYmxlIGFzIHdl
bGwgZm9yIG90aGVyIEdMMzUyMyB2YXJpYW50cywgc28gSSdkIHN1Z2dlc3QKPiA+IHRvIGRyb3Ag
dGhlIHN1ZmZpeC4gTm90IHN1cmUgd2hhdCAnT0hHJyBzdGFuZHMgZm9yLCB0aGUgR2VuZXN5cyB3
ZWJzaXRlCj4gPiBvbmx5IGxpc3RzIGEgR0w4NTJHIGh1YiB3aXRoIGRpZmZlcmVudCBwYWNrYWdl
IHR5cGVzIChub25lIG9mIHRoZW0gJ09IRycpLAo+ID4gc28gSSdkIHNheSBkcm9wIHRoZSBzdWZm
aXggdW5sZXNzIGl0IGlzIGtub3duIHRoYXQgJ09IRycgdmFyaWFudCB1c2VzCj4gPiBhIGRpZmZl
cmVudCBwcm9kdWN0IGlkIHRoYW4gb3RoZXIgR0w4NTJHIHZhcmlhbnRzCj4gPgo+IAo+IFllcywg
SSB3aWxsIGJlIHN1cmUgdG8gZG8gdGhpcyByZWZlcmVuY2UsIEkganVzdCBwaWNrZWQgdGhlc2Ug
ZnJvbSB0aGUKPiBib2FyZCBzY2hlbWF0aWNzLgo+IAo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5
cyxnbDg1MGcueWFtbCB8IDIgKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdAo+ID4gPiA+ID4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+ID4g
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUw
Zy55YW1sCj4gPiA+ID4gPiBpbmRleCBhOWY4MzE0NDhjY2EuLmRiMDA5ZjNlZjQzOCAxMDA2NDQK
PiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2Vu
ZXN5cyxnbDg1MGcueWFtbAo+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1sCj4gPiA+ID4gPiBAQCAtMTYsNiArMTYs
OCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gICAgY29tcGF0aWJsZToKPiA+ID4gPiA+ICAgICAg
ZW51bToKPiA+ID4gPiA+ICAgICAgICAtIHVzYjVlMyw2MDgKPiA+ID4gPiA+ICsgICAgICAtIGdl
bmVzeXMsdXNiNWUzLDYxMAo+ID4gPiA+ID4gKyAgICAgIC0gZ2VuZXN5cyx1c2I1ZTMsNjIwCj4g
PiA+ID4KPiA+ID4gPiBJIGRvbid0IHRoaW5rIGdlbmVzeXMsIGlzIG5lZWRlZCBoZXJlIGJlY2F1
c2UgdXNiNWUzIG1lYW5zIFVTQiBWSUQKPiA+ID4gPiAweDA1ZTMsIHdoaWNoIGlzIGFscmVhZHkg
bGlua2VkIHRvIEdlbmVzeXMgTG9naWMuCj4gPiA+ID4KPiA+ID4KPiA+ID4gT2ssIEkgYWRkZWQg
dGhpcyBhcyBnZW5lc3lzLCBpcyBpdCBwYXJ0IG9mIHRoZSBtYW51ZmFjdHVyZXIgb3IgdmVuZG9y
IG5hbWUKPiA+ID4gd2hpY2ggaXMgbW9zdCBjb21tb25seSB1c2VkIGZvciBhZGRpbmcgdmVuZG9y
LXNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5ncy4KPiA+Cj4gPiBUaGF0IGRvZXNuJ3QgZm9sbG93
IHRoZSBnZW5lcmljIFVTQiBiaW5kaW5nLCBwbGVhc2UgZHJvcCAnZ2VuZXN5cywnLgo+ID4KPiAK
PiBZZXMsIEkgd2lsbCBkcm9wIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiA+ID4gPiBJ
biBhZGRpdGlvbiwgdGhlIGNvbnRyb2wgbG9naWMgb2YgdGhlc2UgdHdvIGh1YnMgYXJlIG5lZWRl
ZCB0byBiZQo+ID4gPiA+IHZlcmlmaWVkLgo+ID4gPgo+ID4gPiBXZSB3ZXJlIHVzaW5nIGdwaW8t
aG9nIHRvIHJlc2V0IHRoZSBVU0IgaHViLCBzbyBub3cgc3dpdGNoIHRvIFVTQiBvbmJvYXJkIGh1
Ygo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQW5kIHdoYXQncyB0aGUgc3RhdHVzIG9mIHRoZSBjb21w
YW5pb24gaHViIG9mIHRoZSBVU0IzIGh1Yj8gSXMgaXQKPiA+ID4gPiByZWFsbHkgYSBVU0IzLW9u
bHkgaHViLCBvciBpcyBpdHMgVVNCMiBwYXJ0IGp1c3QgZXF1YWwgdG8gYW5vdGhlciBVU0IzCj4g
PiA+ID4gaHViPwo+ID4gPiA+Cj4gPiA+IHVzYjVlMyw2MTAgaXMgVVNCIDIuMCBwb3J0IGh1YiBw
cmVzZW50IG9uIE9kcm9pZCBDMSBhbmQgT2Ryb2lkIEMyIGJvYXJkCj4gPiA+Cj4gPiA+IHVzYjVl
Myw2MjAgaXMgVVNCIDMuMSBwb3J0IGh1YiBwcmVzZW50IG9uIE9kcm9pZCBOMi4KPiA+Cj4gPiBM
aWtlIEljZW5vd3kgSSB3b3VsZCBleHBlY3QgdGhlIEdMMzUyMyB0byBwcm92aWRlIGFsc28gYSAy
LjAgaHViLgo+ID4KPiA+IFdoYXQgaXMgdGhlIG91dHB1dCBvZiAnbHN1c2InIG9uIHRoZSBPZHJv
aWQgTjI/Cj4gCj4gYWxhcm1Ab2Ryb2lkLW4yOn4kIGxzdXNiIC10dgo+IC86ICBCdXMgMDIuUG9y
dCAxOiBEZXYgMSwgQ2xhc3M9cm9vdF9odWIsIERyaXZlcj14aGNpLWhjZC8xcCwgNTAwME0KPiAg
ICAgSUQgMWQ2YjowMDAzIExpbnV4IEZvdW5kYXRpb24gMy4wIHJvb3QgaHViCj4gICAgIHxfXyBQ
b3J0IDE6IERldiAyLCBJZiAwLCBDbGFzcz1IdWIsIERyaXZlcj1odWIvNHAsIDUwMDBNCj4gICAg
ICAgICBJRCAwNWUzOjA2MjAgR2VuZXN5cyBMb2dpYywgSW5jLiBHTDM1MjMgSHViCj4gLzogIEJ1
cyAwMS5Qb3J0IDE6IERldiAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2ktaGNkLzJwLCA0
ODBNCj4gICAgIElEIDFkNmI6MDAwMiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290IGh1Ygo+ICAg
ICB8X18gUG9ydCAxOiBEZXYgMiwgSWYgMCwgQ2xhc3M9SHViLCBEcml2ZXI9aHViLzRwLCA0ODBN
Cj4gICAgICAgICBJRCAwNWUzOjA2MTAgR2VuZXN5cyBMb2dpYywgSW5jLiBIdWIKClRoYW5rcy4g
U28gaXQgbG9va3MgbGlrZSAweDA2MTAgaXMgdGhlIHByb2R1Y3QgaWQgb2YgdGhlIFVTQiAyLjAg
cG9ydGlvbgpvZiB0aGUgR0wzNTIzLiBGcm9tIHRoaXMgcGF0Y2ggaXQgc2VlbXMgdGhlIEdMODUy
RyB1c2VzIHRoZSBzYW1lIHByb2R1Y3QKaWQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
