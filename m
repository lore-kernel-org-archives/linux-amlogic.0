Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4ACCCA47F
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jun 2022 07:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zloawIeq8YWjPcRMH3Az16c8YaBya447J1wQDBkD3iw=; b=ju+3ILzXUyda5I+3EwunNTgaHH
	FhgxC2++ALIzfmx5ET0TBcQ58H9eW4bj+ks5kiom+ZgYCEG9jn/QcD+byaemTS6ta93zevlqhUdAO
	lkM1IkxqLARzwL3Obl3gacOc8NmG8nqoggR6IcJsLqsooniDtaiCq/Wm9vxsYBREEre8R+L8cC7qH
	3kHnwxrQznY3fLT5ee6ZPqaDmCNuk72EBeChyXUzxcTB0tL8F1JNbiTkqjKffUwEKrChI+BZ20Ci7
	Zqc2O17+xRcEoTU4gUoHbpRVtttBuzhTAvcbzXYcInes3E8srZ57cng8DdcY5e6UWmYwQyGbJ7I2i
	BrACk5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HII-00DshZ-P4; Thu, 23 Jun 2022 07:30:26 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HI6-00Dsb0-Fa; Thu, 23 Jun 2022 07:30:15 +0000
Received: by mail-ej1-f46.google.com with SMTP id pk21so16045894ejb.2;
        Thu, 23 Jun 2022 00:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pCJQPDJM0DHo8w0E8CwSS4Lsl1UxwVygfcfBvOi6lBU=;
        b=S03sO7Oov9dtKu6HLkHvKG3XwdFaAe2T7HcMq6Sr+UXd4/pX/La2Z+fsTWL4PQaJWu
         04uOOPlthUZpa5BNxHHIJ2pfT88GAN7pjgO9ROzixHBNB1UxqWNHYZln7bhMCgsaW1Ts
         pcUtbNoDYIeTCaTHf6lxwOg5jOTo9oKBaN563SErMz0IlhwnyhwcazSCQzTgGnkrhEmv
         24SiOmuoUlBCZJsFMNMk9Z3pxeAFhBTBDsItg2N+UmNjI2Z5kqiX2N6ZaFOKzN8fnyik
         /lEDuH6X+EWW607OLMODFY3ODuum35BcoqqOg9N0e5PIp5FL5tcg69eRqtZ0aVfC8HE2
         AVww==
X-Gm-Message-State: AJIora9vP8HshvDABCwS7j7xaYKQ2pySKryt/Cz168ciUgmzCLOspR9X
	FF2YJ9lwjOvt6PD9Z++KHQM=
X-Google-Smtp-Source: AGRyM1uzgyyn+5wazWdjwR1XOCL14kh/tF9Cc3OS+496AVZLMjXbvILFPpyZx/g8PE1USH6/kwYwKA==
X-Received: by 2002:a17:906:2a86:b0:711:d8a5:cb0c with SMTP id l6-20020a1709062a8600b00711d8a5cb0cmr6783395eje.426.1655969411375;
        Thu, 23 Jun 2022 00:30:11 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id l16-20020aa7cad0000000b0043585bb803fsm8076171edt.25.2022.06.23.00.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 00:30:10 -0700 (PDT)
Message-ID: <e864ffbc-5885-f648-01c4-68a598f942b9@kernel.org>
Date: Thu, 23 Jun 2022 09:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] serial: Use UART_XMIT_SIZE
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org
References: <20220621124958.3342-1-ilpo.jarvinen@linux.intel.com>
 <20220621124958.3342-6-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220621124958.3342-6-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_003014_560177_41C7C7D7 
X-CRM114-Status: GOOD (  13.98  )
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

T24gMjEuIDA2LiAyMiwgMTQ6NDksIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+IC0tLSBhL2luY2x1
ZGUvbGludXgvc2VyaWFsLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NlcmlhbC5oCj4gQEAgLTks
NyArOSw2IEBACj4gICAjaWZuZGVmIF9MSU5VWF9TRVJJQUxfSAo+ICAgI2RlZmluZSBfTElOVVhf
U0VSSUFMX0gKPiAgIAo+IC0jaW5jbHVkZSA8YXNtL3BhZ2UuaD4KPiAgICNpbmNsdWRlIDx1YXBp
L2xpbnV4L3NlcmlhbC5oPgo+ICAgCj4gICAvKiBIZWxwZXIgZm9yIGRlYWxpbmcgd2l0aCBVQVJU
X0xDUl9XTEVOKiBkZWZpbmVzICovCj4gQEAgLTI1LDExICsyNCw2IEBAIHN0cnVjdCBhc3luY19p
Y291bnQgewo+ICAgCV9fdTMyCWJ1Zl9vdmVycnVuOwo+ICAgfTsKPiAgIAo+IC0vKgo+IC0gKiBU
aGUgc2l6ZSBvZiB0aGUgc2VyaWFsIHhtaXQgYnVmZmVyIGlzIDEgcGFnZSwgb3IgNDA5NiBieXRl
cwo+IC0gKi8KPiAtI2RlZmluZSBTRVJJQUxfWE1JVF9TSVpFIFBBR0VfU0laRQo+IC0KPiAgICNp
bmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+ICAgCj4gICAjZW5kaWYgLyogX0xJTlVYX1NFUklB
TF9IICovCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaCBiL2luY2x1
ZGUvbGludXgvc2VyaWFsX2NvcmUuaAo+IGluZGV4IDU1MThiNzAxNzdiMy4uMTc2N2RlZTk4MDIx
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvc2VyaWFsX2NvcmUuaAo+IEBAIC0yOTYsNiArMjk2LDcgQEAgc3RydWN0IHVhcnRf
c3RhdGUgewo+ICAgCXN0cnVjdCB1YXJ0X3BvcnQJKnVhcnRfcG9ydDsKPiAgIH07Cj4gICAKPiAr
LyogVGhlIHNpemUgb2YgdGhlIHNlcmlhbCB4bWl0IGJ1ZmZlciBpcyAxIHBhZ2UsIG9yIDQwOTYg
Ynl0ZXMgKi8KClRoYXQgaXMgbm90IGNvbXBsZXRlbHkgdHJ1ZSwgSSdkIHJlbW92ZSB0aGUgIm9y
IiBwYXJ0LiBIbW0sIGJ1dCB0aGVuIHRoZSAKY29tbWVudCBpcyBzb21laG93IHN1cGVyZmx1b3Vz
IGFzIGl0IHNheXMgd2hhdCB3ZSBjYW4gc2VlIGJlbG93LiBTbyAKbWF5YmUgZG9uJ3QgYWRkIGl0
IGF0IGFsbD8KCj4gICAjZGVmaW5lIFVBUlRfWE1JVF9TSVpFCVBBR0VfU0laRQoKdGhhbmtzLAot
LSAKanMKc3VzZSBsYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
