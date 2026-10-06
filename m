Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F67CA5FED
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u3/IFaYJqXyVp0YAHr9oxrmL4DNoNmVEqv5VJn8z0o=; b=pJfAxD/k1D3fZY
	PP+r+cUu1umdQ9/GEE81GqdaboiFwQA+0nglpa0HZqx1Ga2iAqtOJitPIrf5qBH84D+L5hww4WUo4
	XSvJEqzJHTdBPWjmTrf4h97d50AUJ4wuQ2DF2BpZdcJPa3QvZyf/fPD1gIQw3wVBQNFyCAiH2Ww/B
	wqddjfPuKM1WqoAm3YgEdNZbsq5g1Dpn1nifO8Lq9foT7XgjGRfakPExalM/ZMcytFHIPWYQyh7gM
	wOqnUPQEaaHYxU5a1hpMYUzvr9Dmdv9otSVp0HsVTctfGhnyC5JT2XKTGnaEc7DI6FYHgpQ8GtQCI
	PWQWnZbOfPwOwyAFcZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE174-00000000LOq-3P42;
	Tue, 06 Oct 2026 09:05:30 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE172-00000000LOJ-3CsI
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Oct 2026 09:05:30 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8925e417565so22516167b3.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2026 02:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277527; x=1791882327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm8inQeYXbBmJrsjm+/9U5OYHNYAqX7VnlqX5vcQTFU=;
        b=cwlP4JPzuf/1VL9ld/FZy0W6G8ppMgP4TXtM/8OkW26FPl7cCTrzwXHZWrkbK+9gc0
         vpuWBqAoFionyNXZcNlWGphk0BAppOwboDpgRqQncX0nH+mqXlY81ZEeD0ixXAcQS3xn
         yT0iXCHCQo0RWePQFh4pil+PzxVqcy5t1V0oINUx6uaqda52pUjYE/u3gvwrmFsT0mXW
         wyRAU0/IwjTwTjtoO14EMG+8gsLb08263fUPCzv5fd+mNNTplTYC4ehnq+qMQwBnE6jb
         Pn4RqJQCZCMyBRBndCNtQMypKKXRIZSimrYWUKa3QrLWugpoYcDFdLASyikS/vFOv1kN
         rkPA==
X-Forwarded-Encrypted: i=1; AKwUvBwI8LLd8d13mmMwi2VwoYzSH2sDUOkbTAlR2eXs01CDX9qGNPzA1nc9HioZx1Cos1g7zRT8YVvDL53BPvp+@lists.infradead.org
X-Gm-Message-State: AFq9FYK0hgclhu/axxn/rZTs07/lmldtWd73cpeFWNDrTzVtORai4xmq
	JZp/aVO6Zi5R9E4I+bHv5NS6W3LWn2piwotYeysb72DBqOw+Ijf2ecfeJQ1sgDzrCBI=
X-Gm-Gg: AYBFou0mHqGYM3EsANqGAKdaxo8WIcz/MMIJ4HqXU5wf+JT5QvqpD4gpCq0ux4fOIcE
	8C8Es1bD4+rHXdhYbt2R03mL7dFeDXooZ5AgUw0E3sYZETTYNGbsEyxQ/nwQYuDLSwFR2zeq0L7
	PWpFvK3aMc0kC7M8wQX73WR9k+rDu5m99qAoIlZ1snro0RYcMg1nKpHKJFPI/5Jn6hLR2FfjXxf
	jLu2Hc6jQGk+cpiakQ+3hN4j5oMHSpxAm/SJZcSNqOl308nJDZUmM/JmUO1d5TIpq/XhdC87Ew/
	jsbqL2m4M7c2lLpMznZaGNaYO766GofkZ9D6yFQRDzVvmIREpO4V3PXR6F7o7F4GZZoUhApsSnN
	qbqUCg2hib6P0CH2kjEj13brsNDvsD7cWuryzE5rYowLbNS5y9IyyY/ksUGDqdzwS+q8CAQ+Zm1
	/D/5q6z77OnnM9Us+/Yo/USJsOMQ4moGcdRGml7A8+iNyRqgVAwlgpVyMhAcqPgXXiAnTXPfVkf
	0Ia2ALZ2MsrhYCxrygrsQV7MgO+DBqmJeR54+7MEdM6LjBtyC5ck+DJJWu0fIZF1Zu85tz4+pJ/
	Zkc=
X-Received: by 2002:a05:690c:88:b0:87e:2404:45fc with SMTP id 00721157ae682-8b04f4053aemr2537107b3.53.1791277526858;
        Tue, 06 Oct 2026 02:05:26 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae321fa8a4sm50115517b3.8.2026.10.06.02.05.25
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:05:26 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac9d666d4eso25916667b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2026 02:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIHvj+Mr84cg+PIo2iqWglwTVfTkkwby9VPxbj24wiDgggwtlEDLp5vrJG5VxAyhMA1XdIIy9HvxugRbIk@lists.infradead.org
X-Received: by 2002:a05:690c:e216:10b0:89a:63bc:8be with SMTP id
 00721157ae682-8b04f45511emr1435597b3.72.1791277525323; Tue, 06 Oct 2026
 02:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-7-tanure@linux.com>
 <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
In-Reply-To: <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:05:13 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
X-Gm-Features: AclHuK8uuG7S1lotg92U6NQL5L-fFOK6A4NsqpautQX6RPIs4c5SrrUvYH9tz8s
Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_020528_818514_40BAD13B 
X-CRM114-Status: GOOD (  30.03  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBPY3QgNSwgMjAyNiBhdCA1OjI34oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gKyZldGhtYWMgewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOwo+
ID4gKyAgICAgcGluY3RybC0wID0gPCZldGhfcGlucz4sIDwmZXRoX3JnbWlpX3BpbnM+Owo+ID4g
KyAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiAr
ICAgICAgKiBUaGUgUkdNSUkgY2xvY2sgZGVsYXlzIGFyZSBhZGRlZCBieSB0aGUgTUFDLCBzbyB0
aGUgUEhZIGlzCj4gPiArICAgICAgKiBhc2tlZCBmb3IgdGhlIG1vZGUgdGhhdCBhZGRzIG5vbmUu
Cj4gPiArICAgICAgKi8KPiA+ICsgICAgIHBoeS1tb2RlID0gInJnbWlpIjsKPiA+ICsgICAgIHBo
eS1oYW5kbGUgPSA8JmV4dGVybmFsX3BoeT47Cj4gPiArICAgICBhbWxvZ2ljLHR4LWRlbGF5LW5z
ID0gPDI+Owo+ID4gKyAgICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8MjAwMD47Cj4KPiBJIGFn
cmVlIHdpdGggTWF4aW1lIGhlcmUsIHJnbWlpIGlzIHdyb25nLiBXZSByZWFsbHkgbmVlZCB0byB1
bmRlcnN0YW5kCj4gd2hhdCBpcyBnb2luZyBvbiBoZXJlLCBlc3BlY2lhbGx5IHNpbmNlIHlvdSBh
cmUgYXNraW5nIGZvciB0aGUgTUFDIHRvCj4gZG8gdGhlIHVzdWFsIDJucywgbm90aGluZyBzcGVj
aWFsLgo+Cj4gSXMgdGhlIFBIWSBub3QgYWN0dWFsbHkgaW5zZXJ0aW5nIHRoZSBjb3JyZWN0IGRl
bGF5PwpJdCBkb2VzLiBUaGUgUEhZIGRyaXZlciBzaG93cyBib3RoIGRlbGF5IGJpdHMgZ29pbmcg
ZnJvbSBvZmYgdG8gb24sIHNvCm5vdGhpbmcgd2FzIHN0cmFwcGVkIGFuZCB0aGUgYm9vdGxvYWRl
ciBkaWQgbm90IHNldCB0aGVtLgoKSSBzd2VwdCB0aGUgTUFDIFJYIGNsb2NrIGRlbGF5IGFuZCBj
b3VudGVkIENSQyBlcnJvcnMsIHRvIHNlZSB3aGVyZSB0aGUKZ29vZCB3aW5kb3cgaXM6CgogIE1B
QyBkb2VzIFJYIGRlbGF5LCBQSFkgbm9uZTogIGNsZWFuIDQwMCAuLiAzODAwcHMKICBQSFkgZG9l
cyBSWCBkZWxheSwgTUFDIGFkZHM6ICBjbGVhbiAwIC4uIDE2MDBwcwoKU2FtZSB3aW5kb3csIG1v
dmVkIDExIHN0ZXBzLiBTbyB0aGUgUEhZIGdpdmVzIGFib3V0IDIyMDBwcywgYW5kIHRoZQpmaXJz
dCB3aW5kb3cgaXMgY2VudHJlZCBhdCAyMTAwcHMuIEl0IGlzIHJpZ2h0LgoKVHJhbnNtaXQgaXMg
dGhlIGJyb2tlbiBvbmUuIFdpdGggcmdtaWktdHhpZCB0aGUgcGVlciBzZWVzIG5vdGhpbmcgd2UK
c2VuZC4KCldoYXQgZG9lcyB0aGUKPiBkYXRhc2hlZXQgc2F5PwpUaGUgQTMxMUQyIGNvdmVycyBi
b3RoIHdheXMgb2YgZG9pbmcgaXQuIFRhYmxlIDUtMjEsIFJHTUlJIHJlY2VpdmU6CgogIFBIWSBp
bnRlcm5hbCBkZWxheSBvbjogICBuZWVkcyAxLjJucyBzZXR1cCBhbmQgMS4ybnMgaG9sZAogIFBI
WSBpbnRlcm5hbCBkZWxheSBvZmY6ICBuZWVkcyAtMC41IC4uIDAuNW5zIHNrZXcKCndpdGggYSBu
b3RlIHRvIGNoZWNrIHNldHVwL2hvbGQgd2hlbiB0aGUgUEhZIGRlbGF5IGlzIG9uLCBhbmQgc2tl
dyB3aGVuCml0IGlzIG9mZi4gVGFibGUgNS0yMiBkb2VzIHRoZSBzYW1lIGZvciB0cmFuc21pdCwg
c2VwYXJhdGUgbnVtYmVycyBmb3IKImNsb2NrIGRlbGF5IGFkZGVkIiBhbmQgIm5vIGNsb2NrIGRl
bGF5IGFkZGVkIi4KClNvIHRoZSBNQUMgZG9pbmcgdGhlIGRlbGF5IGlzIGEgZG9jdW1lbnRlZCBt
b2RlIG9mIHRoaXMgU29DLgoKV2hhdCBpdCBkb2VzIG5vdCBzYXkgaXMgd2h5IHRoZSBQSFkgVFgg
ZGVsYXkgbWlzc2VzLiBJIGFza2VkIEtoYWRhcwphYm91dCB0aGUgY2xvY2sgdHJhY2UgbGVuZ3Ro
cywgbm8gYW5zd2VyIHlldC4KPgo+IEFsc28sIHdlIGhhdmUgb25lIHZlbmRvciBwcm9wZXJ0eSBh
bmQgb25lIGdlbmVyaWMgcHJvcGVydHkuIENhbgo+IGFtbG9naWMsdHgtZGVsYXktbnMgYmUgcmVw
bGFjZWQgYnkgdHgtaW50ZXJuYWwtZGVsYXktcHM/IEJ1dCB0aGF0Cj4gY29tZXMgbGF0ZXIsIG9u
Y2Ugd2UgaGF2ZSBkZXRlcm1pbmVkIHRoZXNlIHByb3BlcnRpZXMgcmVhbGx5IG11c3QgYmUKPiB1
c2VkLgpBIG5ldyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgd2lsbCBoYXZlIGEgZml4IGZvciBpdC4g
SXQgd2lsbCBwcmVmZXIgdGhlCmdlbmVyaWMgb25lLgpPbmUgdGhpbmcgdG8ga25vdzogdGhhdCBy
ZWdpc3RlciBmaWVsZCBpcyBhIGZyYWN0aW9uIG9mIHRoZSBjbG9jawpwZXJpb2QsIG5vdCBhIHRp
bWUuClRoZSBkcml2ZXIgY29tbWVudCBzYXlzICI4bnMgLyA0ICogdHhfZGx5X3ZhbCIuIEEgcXVh
cnRlciBjeWNsZSBpcyAybnMKYXQgMUdiaXQgYW5kIDEwbnMKYXQgMTAwTWJpdCwgc28gMjAwMCBp
cyBvbmx5IHRydWUgYXQgZ2lnYWJpdC4KPgo+IEh1bW0sIHdoYXQgaXMgbWVzb244Yl9pbml0X3Jn
bWlpX2RlbGF5cygpIGRvaW5nPwpJdCBwaWNrcyB0aGUgTUFDIGRlbGF5cyBmcm9tIHBoeS1tb2Rl
IGFsb25lLCB3aXRoIHRoZSBzZW5zZSBpbnZlcnRlZDoKCiAgcmdtaWkgICAgICAgTUFDIGFkZHMg
Ym90aCBkZWxheXMKICByZ21paS1yeGlkICBNQUMgYWRkcyBUWAogIHJnbWlpLXR4aWQgIE1BQyBh
ZGRzIFJYCiAgcmdtaWktaWQgICAgTUFDIGFkZHMgbm9uZQoKU28gdGhlIG1vZGUgdGhhdCBzYXlz
IHRoZSBkZWxheXMgYXJlIGludGVybmFsIGlzIHRoZSBvbmUgd2hlcmUgdGhlIE1BQwpzd2l0Y2hl
cyBpdHMgb3duIG9mZi4gSXQgYWxzbyBpZ25vcmVzIHRoZSAqLWludGVybmFsLWRlbGF5LXBzCnBy
b3BlcnRpZXMgaW4gdGhvc2UgbW9kZXMuIFdpdGggcmdtaWktaWQgYW5kIGJvdGggb2YgdGhlbSBz
ZXQgSSBnZXQ6CgogIHBoeS1tb2RlIHJnbWlpLWlkOiB0eC1kZWxheS1ucyAyIHJ4LWRlbGF5LXBz
IDIwMDAKICAgIC0+IFBSR19FVEgwIGRlbGF5X2NvbmZpZyAweDAsIFBSR19FVEgxIGNmZ19yeGNs
a19kbHkgMHgwCgpXaGF0IGlzCj4gcGh5ZGV2LT5pbnRlcmZhY2UgaW4gdGhlIFBIWSBkcml2ZXIu
CldoYXRldmVyIHBoeS1tb2RlIHNheXMsIGR3bWFjLW1lc29uOGIuYyBuZXZlciByZXdyaXRlcyBp
dC4gV2hpY2gKbWVhbnMgdGhlIE1BQyBhbmQgdGhlIFBIWSBhbHdheXMgc3BsaXQgdGhlIGpvYjoK
CiAgcmdtaWkgICAgICAgTUFDIGJvdGggICAgUEhZIG5vbmUKICByZ21paS1yeGlkICBNQUMgVFgg
ICAgICBQSFkgUlgKICByZ21paS10eGlkICBNQUMgUlggICAgICBQSFkgVFgKICByZ21paS1pZCAg
ICBNQUMgbm9uZSAgICBQSFkgYm90aAoKVGhleSBuZXZlciBib3RoIGRlbGF5IHRoZSBzYW1lIGNs
b2NrLCBhbmQgbmV2ZXIgYm90aCBza2lwIGl0LiBTbyB0aGUKZHJpdmVyIGlzIHNlbGYgY29uc2lz
dGVudCwgaXQgaXMganVzdCBsYWJlbGxlZCBiYWNrd2FyZHMgZnJvbSBwaHkucnN0LgpUaGF0IGlz
IHdoeSB0aGUgYm9hcmRzIHVzaW5nICJyZ21paSIgd29yaywgYW5kIHdoeSByZ21paS1pZCBpcyB0
aGUgb25lCnRoYXQgZG9lcyBub3QgaGVyZTogaXQgaXMgdGhlIG1vZGUgdGhhdCBoYW5kcyBldmVy
eXRoaW5nIHRvIHRoZSBQSFkuCj4KPiBQbGVhc2UgdGFrZSBhIHJlYWQgb246Cj4KPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9ldGhlcm5ldC1jb250cm9sbGVyLnlhbWwjTDI4Nwo+Cj4gYW5k
IGZpZ3VyZSBvdXQgd2hhdCBpcyBnb2luZyBvbiBoZXJlLCBiZWNhdXNlIGF0IGEgZmlyc3QgbG9v
aywgaXQKPiBzZWVtcyBicm9rZW4uCj4KPiAgICAgICBBbmRyZXcKSXQgaXMgYnJva2VuLiBwaHkt
bW9kZSBkZXNjcmliZXMgdGhlIFBDQiwgYnV0IGR3bWFjLW1lc29uOGIuYyByZWFkcyBpdAphcyB3
aGljaCBjaGlwIGFkZHMgdGhlIGRlbGF5LiBUaGUgbGFiZWxzIGFyZSBiYWNrd2FyZHMsIGFuZCBp
biByZ21paS1pZApib3RoICotaW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGllcyBhcmUgaWdub3Jl
ZC4KCkkgbWVhc3VyZWQgZWFjaCBkaXJlY3Rpb24gd2l0aCBhbiBleWUgc2Nhbi4gVGhlIFBIWSBS
WCBkZWxheSBpcyBmaW5lLAphYm91dCAyMjAwcHMuIEl0cyBUWCBkZWxheSBkb2VzIG5vdCB3b3Jr
IGF0IGFsbCwgc28gdGhlIE1BQyBtdXN0IGRvCnRoYXQgb25lLgoKRml4OiBpbiB0aGUgLWlkIG1v
ZGVzIGVhY2ggKi1pbnRlcm5hbC1kZWxheS1wcyBwcm9wZXJ0eSBtZWFucyB0aGUgTUFDCmRvZXMg
dGhhdCBkZWxheSwgYW5kIHRoZSBQSFkgaXMgdG9sZCB0byBkbyB0aGUgcmVzdDoKCiAgYm90aCBw
cm9wZXJ0aWVzICAgIE1BQyBkb2VzIFRYIGFuZCBSWCAgICAgUEhZIHRvbGQgcmdtaWkKICB0eCBw
cm9wZXJ0eSBvbmx5ICAgIE1BQyBkb2VzIFRYICAgICAgICAgICAgICAgICBQSFkgdG9sZCByZ21p
aS1yeGlkCiAgcnggcHJvcGVydHkgb25seSAgICBNQUMgZG9lcyBSWCAgICAgICAgICAgICAgICAg
UEhZIHRvbGQgcmdtaWktdHhpZAogIG5vIHByb3BlcnR5ICAgICAgICAgICBNQUMgZG9lcyBub3Ro
aW5nICAgICAgICAgIFBIWSB0b2xkIHJnbWlpLWlkCgpCb2FyZHMgd2l0aG91dCB0aG9zZSBwcm9w
ZXJ0aWVzIGtlZXAgdG9kYXkncyBiZWhhdmlvdXIsIHNvCm1lc29uOGItb2Ryb2lkYzEgYW5kIG1l
c29uOG0yLW14aWlpLXBsdXMgYXJlIHVudG91Y2hlZC4KClZpbTQgd2lsbCB1c2UgcGh5LW1vZGUg
PSAicmdtaWktaWQiIHdpdGggdHgtaW50ZXJuYWwtZGVsYXktcHMgPQo8MjAwMD4uIDkzNU1iaXQv
cyBib3RoIHdheXMsIG5vIENSQyBlcnJvcnMuCgpJIGFtIHNlbmRpbmcgYSB2MiB3aXRoIHRoZSBm
aXggZm9yIGR3bWFjLW1lc29uOGIuYyAgYXMgaXRzIG93biBwYXRjaC4KClRoYW5rcwpMdWNhcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
