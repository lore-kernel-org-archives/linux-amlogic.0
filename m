Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464FCC77B73
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOnXR0hI6TNzO9XCxzCZHWkDhrJH/n7VGCvlboFJgcE=; b=z+NOniwUhXV21n
	7k3IGdOtR2EArVF+NCt0GYHtKL20AQaGIOi5SRXpoVOG2W0MlvVYZbRjxNNB293btxsDK142JSBKH
	yMM/X3B/Bm27MlAsliRAINNS44VPTwPO2iqLS5Qcvtc7GwX80tPn8rpA0J/f/plEGQY56/5W97rg5
	MMzfGgWu/mJ0Jyih+II5g+R+AerhmiiLjNbVi9cgJfpwIt0MKHSIE0XuKNsrd+nuJ+/L8KuSJxBwm
	UpKsU6dvd2ulsZp+cIZ/pwV3qI7BquM3msKQGzy+XJFrP0aA+DfRGop2vylVvBPBc9La/YeX0Ro1J
	un9eoVmv70Rd8TLXutPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po81g-00EMbl-0c;
	Sun, 16 Apr 2023 19:27:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po81b-00EMax-2h;
	Sun, 16 Apr 2023 19:27:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id dx24so14796121ejb.11;
        Sun, 16 Apr 2023 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681673215; x=1684265215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Zvi7xXB7d3Skv4cg+fSfi8Z0mY25ZNLv9NUpsbKDPk=;
        b=Oc2La1hoWCL76+LxZ4Ujn1RrJhAOCSMrKRsNeGKFPX3164juSeUPlFAIapK6YLfuxI
         gqtNqwcXPLpOH/9PmgZAGJF3N80ndnEk1P25LnakCHReCtDUQSmr5DoqjR/pmqy998mP
         5L5ZDzdiD3cl+Jj+iPMDGaQj8BJPK/TkZiecChXe00s512Nz+qUvhmxMjBiQob4QIOzb
         q0Byuxoy16zW17XKIApMfGzMwuiYBFVkt7ILeGhtvfkPrjU0AAeEbj6AwOjmllzi78Ir
         ZgyjzeUPJAj1TbtFnZ5hK0/iM+7Yol8ZIgxx3jGM02vXg8CwkeF2AXuQKqNx1fTtoI1d
         bC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681673215; x=1684265215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Zvi7xXB7d3Skv4cg+fSfi8Z0mY25ZNLv9NUpsbKDPk=;
        b=XAPTxtLJY0qYjk3sWKExQKgP8CEPcWavdLMQIYTHHiZxexFUJJgnmkx2oQq8VCPl+N
         RDSh5oaOwuYWO2Mz3UVLNxW6RP4xbFyALfAowkm4cKENO83oQJoPrIS8VNgxvmeOjJOo
         w+9PXf2HDO4J3wISqlNoh2XOPVRlweEAvWSsaxqKiuXXy1EAm/lshCzXeTJd4soZzfNX
         JXnRF8I749isURW/IHlwJ3O+kpGF8VXyNhtGvSedzLpZrM/jPCgGtGaEGVpm4L/VOgvm
         i3r2FbSF0Kt1O8FnSy6IySuVUCW2791uj1hQDhtSdC+z/g7WN1CQc2QBztZrD3Mv0ClV
         J9SA==
X-Gm-Message-State: AAQBX9fCs5wgmRuEoSGXlsOcLkwvNSgmGDx3kf8R3xt3vphuEWySMsSW
	VomI1p/vsI54U3+LHc32QZhjexKyzyQQQhBMXtE=
X-Google-Smtp-Source: AKy350YTAwoK+nVnrhCWR45EmnO1LDfk4dEsdNk9NI7vGk6knkk+cKl4kftmVR3zY6sOkEvpURXA6q08FjZY+cbN3DA=
X-Received: by 2002:a17:906:7f99:b0:94b:d57e:9d4b with SMTP id
 f25-20020a1709067f9900b0094bd57e9d4bmr5480278ejr.2.1681673215415; Sun, 16 Apr
 2023 12:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com> <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
 <4b328dab-5f96-e5d0-3181-ce059d11b04b@gmail.com>
In-Reply-To: <4b328dab-5f96-e5d0-3181-ce059d11b04b@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 Apr 2023 21:26:44 +0200
Message-ID: <CAFBinCCxQvB_fY0r4jkwy7zW1F9s2vrxmcRaTs6hG5ay_Gf8mw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_122659_894755_DDF21C2D 
X-CRM114-Status: GOOD (  23.70  )
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

SGkgSGVpbmVyLAoKT24gU2F0LCBBcHIgMTUsIDIwMjMgYXQgODozOeKAr0FNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMTQuMDQuMjAyMyAyMToz
OSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IEhlbGxvIEhlaW5lciwKPiA+Cj4gPiBP
biBUaHUsIEFwciAxMywgMjAyMyBhdCA3OjU14oCvQU0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBbLi4uXQo+ID4+IFRlc3RlZC1ieTogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiA+IFVuZm9y
dHVuYXRlbHkgSSBoYXZlIHNvbWUgYmFkIG5ld3MgYW5kIEkgbmVlZCB0byB0YWtlIGJhY2sgbXkg
VGVzdGVkLWJ5IDotKAo+ID4gUHJldmlvdXNseSBteSB0ZXN0IHdhczogY3ljbGUgdGhyb3VnaCBh
bGwgYXZhaWxhYmxlIENQVSBmcmVxdWVuY2llcwo+ID4gd2hpbGUgc3RyZXNzaW5nIHRoZSBDUFUu
Cj4gPiBNeSBhc3N1bXB0aW9uIHdhczogaWYgdGhlIHN5c3RlbSBkb2Vzbid0IGxvY2sgdXAgZXZl
cnl0aGluZydzIGZpbmUKPiA+IGJlY2F1c2Ugd2UgaGF2ZSBhIGhpZ2ggZW5vdWdoIHZvbHRhZ2Uu
Cj4gPgo+ID4gVGhpcyBldmVuaW5nIGhvd2V2ZXIgSSBnb3QgYSBtZW1vcnkgY29ycnVwdGlvbiBl
cnJvciB3aGlsZSB0cnlpbmcgdG8KPiA+IGxvZyBpbiB2aWEgVUFSVCAtIHdoaWNoIEkgdGhvdWdo
dCB3YXMgc3RyYW5nZS4KPiA+IFNvIEkgY29ubmVjdGVkIG15IGxvZ2ljIGFuYWx5emVyIHRvIG15
IE9kcm9pZC1DMSBhbmQgZGlkIHNvbWUgZXhwZXJpbWVudHM6Cj4gPgo+ID4gcGVyaW9kID0gMzA1
MTgsIGR1dHkgY3ljbGUgPSAxNTI1OSAodHlwaWNhbGx5IHVzZWQgZm9yIHRoZSAzMmtIego+ID4g
b3V0cHV0IHRvIHRoZSBTRElPIHdpZmkgY2hpcCkKPiA+IGJlZm9yZSB5b3VyIHBhdGNoZXMgLyBh
ZnRlciBhcHBseWluZyB5b3VyIHBhdGNoZXM6Cj4gPiBQV006IGR1dHkgY3ljbGU6IDUwLjAwMDAw
MCUgLyA1MC4wMDAwMDAlCj4gPiBQV006IHBlcmlvZDogMzAuNiDCtXMgLyAzMC41IMK1cwo+ID4g
VGltaW5nOiBUaW1lOiAxNS4yOTIgwrVzICg2NS4zOTUga0h6KSAvIDE1LjI1MCDCtXMgKDY1LjU3
NCBrSHopCj4gPiBUaW1pbmc6IEF2ZXJhZ2U6IDE1LjI5NiDCtXMgKDY1LjM3NyBrSHopIC8gMTUu
MjY0IMK1cyAoNjUuNTEzIGtIeikKPiA+IGRyaXZlciBkZWJ1ZyBtZXNzYWdlcyB3aXRoIHlvdXIg
cGF0Y2hlcyBhcHBsaWVkOgo+ID4gZmluX2ZyZXE6IDg1MDAwMDAwMCBIego+ID4gcGVyaW9kPTMw
NTE4IGNudD0yNTk0MAo+ID4gZHV0eT0xNTI1OSBkdXR5X2NudD0xMjk3MAo+ID4KPiA+IFRoZW4g
SSB0cmllZCBwZXJpb2QgPSAxMjIxOCwgZHV0eSBjeWNsZSA9IDAgKHR5cGljYWxseSB1c2VkIGZv
ciB0aGUKPiA+IGhpZ2hlc3QgQ1BVIHZvbHRhZ2UpOgo+ID4gYmVmb3JlIHlvdXIgcGF0Y2hlcyAv
IGFmdGVyIGFwcGx5aW5nIHlvdXIgcGF0Y2hlczoKPiA+IFBXTTogZHV0eSBjeWNsZTogMC4zMzg5
ODMlIC8gbi9hIChjb25zdGFudCBsb3cgb3V0cHV0KQo+ID4gUFdNOiBwZXJpb2Q6IDEyLjMgwrVz
IC8gbi9hCj4gPiBUaW1pbmc6IFRpbWU6IDEyLjI1MCDCtXMgKDgxLjYzMyBrSHopIC8gbi9hCj4g
PiBUaW1pbmc6IEF2ZXJhZ2U6IDYuMTQ4IMK1cyAoMTYyLjY2OCBrSHopIC8gbi9hCj4gPiBkcml2
ZXIgZGVidWcgbWVzc2FnZXMgd2l0aCB5b3VyIHBhdGNoZXMgYXBwbGllZDoKPiA+IGZpbl9mcmVx
OiA4NTAwMDAwMDAgSHoKPiA+IHBlcmlvZD0xMjIxOCBjbnQ9MTAzODUKPiA+Cj4gV2l0aCBhIDg1
ME1IeiBpbnB1dCBjbG9jayB3ZSBzaG91bGQgc2VlIGEgMC4wMSUgZHV0eSBjeWNsZSB3aXRoIDEu
Mm5zCj4gY2xvY2sgcHVsc2VzLiBDYW4gd2UgcnVsZSBvdXQgYW4gaXNzdWUgd2l0aCB0aGUgbWVh
c3VyaW5nIGVxdWlwbWVudD8KPiBJcyB5b3VyIGxvZ2ljIGFuYWx5emVyIGFibGUgdG8gZGlzcGxh
eSBzdWNoIHNob3J0IGNsb2NrIHB1bHNlcz8KT2gsIHlvdSdyZSByaWdodDogbXkgbG9naWMgYW5h
bHl6ZXIgbWF4ZXMgb3V0IGF0IDI0TUh6ICh+NDJucykuClNvIHdlIGNhbiBpZ25vcmUgdGhpcyBj
YXNlLgoKPiA+IEZpbmFsbHkgSSB0cmllZCBwZXJpb2QgPSAxMjIxOCwgZHV0eSBjeWNsZSA9IDEy
MjE4ICh0eXBpY2FsbHkgdXNlZCBmb3IKPiA+IHRoZSBsb3dlc3QgQ1BVIHZvbHRhZ2UpOgo+ID4g
YmVmb3JlIHlvdXIgcGF0Y2hlcyAvIGFmdGVyIGFwcGx5aW5nIHlvdXIgcGF0Y2hlczoKPiA+IFBX
TTogZHV0eSBjeWNsZTogOTkuNjYxMDE3JSAvIG4vYSAoY29uc3RhbnQgbG93IG91dHB1dCkKSSBo
YXZlIHRvIGNvcnJlY3QgbXlzZWxmOiBmb3IgdGhpcyBjYXNlIG15IGxvZ2ljIGFuYWx5emVyIHNl
ZXMgYToKY29uc3RhbnQgaGlnaCBzaWduYWwKCj4gPiBQV006IHBlcmlvZDogMTIuMyDCtXMgLyBu
L2EKPiA+IFRpbWluZzogVGltZTogMTIuMjUwIMK1cyAoODEuNjMzIGtIeikgLyBuL2EKPiA+IFRp
bWluZzogQXZlcmFnZTogNi4xNDggwrVzICgxNjIuNjY4IGtIeikgLyBuL2EKPiA+IGRyaXZlciBk
ZWJ1ZyBtZXNzYWdlcyB3aXRoIHlvdXIgcGF0Y2hlcyBhcHBsaWVkOgo+ID4gZmluX2ZyZXE6IDg1
MDAwMDAwMCBIego+ID4gcGVyaW9kPTEyMjE4IGNudD0xMDM4NQo+ID4KPiBIZXJlIEkgaGF2ZSBu
byBpZGVhIHlldC4KWy4uLl0KPiBBdCBmaXJzdCBJJ2QgbGlrZSB0byB2ZXJpZnkgdGhhdCB0aGUg
cmVnaXN0ZXJzIGhhdmUgdGhlIGV4cGVjdGVkIHZhbHVlcy4KPiBDYW4geW91IHByb3ZpZGUgdGhl
IHZhbHVlcyBvZiBQV01fQS9CIChkZXBlbmRpbmcgb24gd2hpY2ggY2hhbm5lbCBpcyB1c2VkIGlu
IHlvdXIKPiBjYXNlKSBhbmQgUFdNX01JU0NfQUIgYXQgdGhlIGVuZCBvZiBtZXNvbl9wd21fZW5h
YmxlKCk/IFRoYW5rcyEKSSdtIHRlc3Rpbmcgd2l0aCBQV01fQiBhbmQgSSBnZXQ6CiAgUkVHX01J
U0NfQUIgPSAweDAwODAwMGMyLCBjaGFubmVsIHJlZyA9IDB4Mjg5MTAwMDAKClRoaXMgcmVnaXN0
ZXIgdmFsdWUgbG9va3MgY29ycmVjdCB0byBtZS4KClRoaXMgaXMgbm93IG15IGxhc3QgbGluZSBp
biBtZXNvbl9wd21fZW5hYmxlKCkgaW4gY2FzZSB5b3Ugd2FudCB0bwpzYW5pdHktY2hlY2sgd2hh
dCBJIGRpZDoKZGV2X2VycihtZXNvbi0+Y2hpcC5kZXYsICJSRUdfTUlTQ19BQiA9IDB4JTA4eCwg
Y2hhbm5lbCByZWcgPSAweCUwOHgiLAp2YWx1ZSwgcmVhZGwobWVzb24tPmJhc2UgKyBjaGFubmVs
X2RhdGEtPnJlZ19vZmZzZXQpKTsKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
