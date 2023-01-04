Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE59C46467
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OJ5fnjv8phZ2Dl9XmgLHmJt70MXEsfAVldgQKgk2MM=; b=nlUxx6+LpvGw52
	BFho56AKKL+PJ3QEt5T/jE+yKodDiziLywEQxcoFP4ptHJWPo9Mqpch01LYIo6qgHGSqkUUL4GLaC
	7TnSntmZR6uayS9DNnX9opM1RKo2RKVIzXBg+5YDiYomDr9rNR7YsLaGSDrGK4vn4bGdTos45VMOj
	BDQmjbFnEbbrQsNoAmb2ML2ExewZ41Xaaiox6H1hK5dk46yp0uUDbPQKh22KwEFYuJmG4tGiJE2qw
	zprSWXxL7i1EKotwV0BF73qErDhz1DwHSJbEqhjQ2JCquYeEncUViKNja8CGZhSvjG5E3fw8GAdWw
	r6JrXrEA46kVJRo7ghNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFpG-00GY3S-1V; Thu, 05 Jan 2023 02:17:50 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCez-00D0v4-0E
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 22:55:07 +0000
Received: by mail-il1-x135.google.com with SMTP id o13so20263746ilc.7
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 14:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UwnDpjFiSkciFHKVlrI1mG8DDOq+XOpoX/kfVjvrTro=;
        b=Zcz3xPJ+1JFsN8TkUpizVFMI3/3KbankwidfAEogRsElmMaK7fKz7Gq5l82fJhhTWp
         nB6LS4NAlqkpmgijPXGKXC6KL+ZwtpCktOKYqdB0CGGssEGxt+0Fth/Adsi9CUroO1iI
         u3E7/ezg/9S8ZhQgSxWaHVYTuE0hLNoTHavbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwnDpjFiSkciFHKVlrI1mG8DDOq+XOpoX/kfVjvrTro=;
        b=vlT7Ki5LaN81XxqD2Ixl/3nmfwMTfFT743gHdsruRCe2+NOi1OYfEy4rNJJyCKGyCE
         IMfqrUIMXvQTittrR/AFGwy0Uu/faNz3qrl9vbVvHBUVkJcgoNV2mWeM8Nd0C6vxhF7K
         2fhZRZcHQujgmoStyqjoXX66t+M9LAPC+kTrTOgMRgsy9KUxrVZW7VwcTCCtri6MNldC
         tFJlDCuW8m9Ny7epnuC7SWJ1i+5n6tuCKxLYswEsPMoLBokdweKAaRyYB9Yyb5WxMqj4
         bQuMDUjSRjL8vojj1sG14SjVxTHtnoE+eL4mamKUX8F1vxhzA1ebAoktaswme/DHPFKh
         cdhw==
X-Gm-Message-State: AFqh2kpPwQb2KPblt+ZU0S46S33x6Ty++TGWcIgMXZ0BphI/ROmbDCqY
	mrYGsjoUFfqLzOO55IXCR4yd6A==
X-Google-Smtp-Source: AMrXdXu92yHSOjcz9PLrUap2yhJ+HjiU6C1sRlFdjYt9OrM5u4rTiXeZerbXc6KEKzKjKg1Rgn4rYw==
X-Received: by 2002:a05:6e02:10d3:b0:30d:7cf4:5d5d with SMTP id s19-20020a056e0210d300b0030d7cf45d5dmr274387ilj.22.1672872898038;
        Wed, 04 Jan 2023 14:54:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id f1-20020a056e0212a100b0030c52450a58sm2658938ilr.64.2023.01.04.14.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:54:57 -0800 (PST)
Date: Wed, 4 Jan 2023 22:54:56 +0000
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
Message-ID: <Y7YDwJX6aqa8vbQK@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_145506_288488_CE556B9C 
X-CRM114-Status: GOOD (  25.05  )
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

T24gV2VkLCBEZWMgMjgsIDIwMjIgYXQgMDM6NTk6MTdQTSArMDUzMCwgQW5hbmQgTW9vbiB3cm90
ZToKPiBIaSBJY2Vub3d5LAo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmlldyBjb21tZW50cwo+IAo+
IE9uIFdlZCwgMjggRGVjIDIwMjIgYXQgMTU6MzgsIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPiB3cm90ZToKPiA+Cj4gPiDlnKggMjAyMi0xMi0yOOaYn+acn+S4ieeahCAxMDowMyArMDAw
MO+8jEFuYW5kIE1vb27lhpnpgZPvvJoKPiA+ID4gQWRkIHVzYiBodWIgZGV2aWNlIGlkIGZvciBH
ZW5lc3lzIExvZ2ljLCBJbmMuIEdMODUyRy1PSEcgSHViIFVTQiAyLjAKPiA+ID4gcm9vdCBodWIg
YW5kIEdlbmVzeXMgTG9naWMsIEluYy4gR0wzNTIzLVFGTjc2IFVTQiAzLjEgcm9vdCBodWIuCgpu
aXQ6IFFGTiA3NiBpcyBvbmUgb2YgdGhlIHBhY2thZ2Ugb3B0aW9ucyBvZiB0aGUgR0wzNTIzLCBJ
IGV4cGVjdCB0aGlzCmJpbmRpbmcgdG8gYmUgYXBwbGljYWJsZSBhcyB3ZWxsIGZvciBvdGhlciBH
TDM1MjMgdmFyaWFudHMsIHNvIEknZCBzdWdnZXN0CnRvIGRyb3AgdGhlIHN1ZmZpeC4gTm90IHN1
cmUgd2hhdCAnT0hHJyBzdGFuZHMgZm9yLCB0aGUgR2VuZXN5cyB3ZWJzaXRlCm9ubHkgbGlzdHMg
YSBHTDg1MkcgaHViIHdpdGggZGlmZmVyZW50IHBhY2thZ2UgdHlwZXMgKG5vbmUgb2YgdGhlbSAn
T0hHJyksCnNvIEknZCBzYXkgZHJvcCB0aGUgc3VmZml4IHVubGVzcyBpdCBpcyBrbm93biB0aGF0
ICdPSEcnIHZhcmlhbnQgdXNlcwphIGRpZmZlcmVudCBwcm9kdWN0IGlkIHRoYW4gb3RoZXIgR0w4
NTJHIHZhcmlhbnRzCgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51
eC5hbW9vbkBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1sIHwgMiArKwo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0Cj4gPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1s
Cj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGds
ODUwZy55YW1sCj4gPiA+IGluZGV4IGE5ZjgzMTQ0OGNjYS4uZGIwMDlmM2VmNDM4IDEwMDY0NAo+
ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMs
Z2w4NTBnLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9nZW5lc3lzLGdsODUwZy55YW1sCj4gPiA+IEBAIC0xNiw2ICsxNiw4IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgIGNvbXBhdGlibGU6Cj4gPiA+ICAgICAgZW51bToKPiA+ID4gICAgICAgIC0g
dXNiNWUzLDYwOAo+ID4gPiArICAgICAgLSBnZW5lc3lzLHVzYjVlMyw2MTAKPiA+ID4gKyAgICAg
IC0gZ2VuZXN5cyx1c2I1ZTMsNjIwCj4gPgo+ID4gSSBkb24ndCB0aGluayBnZW5lc3lzLCBpcyBu
ZWVkZWQgaGVyZSBiZWNhdXNlIHVzYjVlMyBtZWFucyBVU0IgVklECj4gPiAweDA1ZTMsIHdoaWNo
IGlzIGFscmVhZHkgbGlua2VkIHRvIEdlbmVzeXMgTG9naWMuCj4gPgo+IAo+IE9rLCBJIGFkZGVk
IHRoaXMgYXMgZ2VuZXN5cywgaXMgaXQgcGFydCBvZiB0aGUgbWFudWZhY3R1cmVyIG9yIHZlbmRv
ciBuYW1lCj4gd2hpY2ggaXMgbW9zdCBjb21tb25seSB1c2VkIGZvciBhZGRpbmcgdmVuZG9yLXNw
ZWNpZmljIGNvbXBhdGlibGUgc3RyaW5ncy4KClRoYXQgZG9lc24ndCBmb2xsb3cgdGhlIGdlbmVy
aWMgVVNCIGJpbmRpbmcsIHBsZWFzZSBkcm9wICdnZW5lc3lzLCcuCgo+ID4gSW4gYWRkaXRpb24s
IHRoZSBjb250cm9sIGxvZ2ljIG9mIHRoZXNlIHR3byBodWJzIGFyZSBuZWVkZWQgdG8gYmUKPiA+
IHZlcmlmaWVkLgo+IAo+IFdlIHdlcmUgdXNpbmcgZ3Bpby1ob2cgdG8gcmVzZXQgdGhlIFVTQiBo
dWIsIHNvIG5vdyBzd2l0Y2ggdG8gVVNCIG9uYm9hcmQgaHViCj4gCj4gPgo+ID4gQW5kIHdoYXQn
cyB0aGUgc3RhdHVzIG9mIHRoZSBjb21wYW5pb24gaHViIG9mIHRoZSBVU0IzIGh1Yj8gSXMgaXQK
PiA+IHJlYWxseSBhIFVTQjMtb25seSBodWIsIG9yIGlzIGl0cyBVU0IyIHBhcnQganVzdCBlcXVh
bCB0byBhbm90aGVyIFVTQjMKPiA+IGh1Yj8KPiA+Cj4gdXNiNWUzLDYxMCBpcyBVU0IgMi4wIHBv
cnQgaHViIHByZXNlbnQgb24gT2Ryb2lkIEMxIGFuZCBPZHJvaWQgQzIgYm9hcmQKPiAKPiB1c2I1
ZTMsNjIwIGlzIFVTQiAzLjEgcG9ydCBodWIgcHJlc2VudCBvbiBPZHJvaWQgTjIuCgpMaWtlIElj
ZW5vd3kgSSB3b3VsZCBleHBlY3QgdGhlIEdMMzUyMyB0byBwcm92aWRlIGFsc28gYSAyLjAgaHVi
LgoKV2hhdCBpcyB0aGUgb3V0cHV0IG9mICdsc3VzYicgb24gdGhlIE9kcm9pZCBOMj8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
