Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059C3E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 20:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSNqFqCcghzX5mBzXXkI/ZRTy6CBp/XueuTQGtKiDKw=; b=K0vjH42vEPzcPM
	VgxZmELkeZfBFA1xIjCoApi0f9TeD98VYqDGvhVgCJit0tH0rlm1Mudw7E+G7lYNa27fM7e0AG9BY
	ik3Duyzlo8n8iawGmg+SLQjNlf+sMjXwrvdagUP24RnbQ+f5WhAKPtaK7e725IQRWf4lnPFSxX8CC
	SFZxWHP0Ra/sKP7hDClAmxJGcLe1sLTWYPcl1aub86mJfVQJzAsnISLYMEe9gXyp7o+bJh3w3Jx9y
	jIHCiyt/Z6NeskbYzIg0HzD14qw5MuId+GdpgVWnpqHEI0RI5cUxBNXRxAbJG3SLoL4mfZsJuuUnF
	/Ts4FASMsp4gahkpYNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtYA-00000002ZeZ-2AYL;
	Mon, 06 Jan 2025 20:18:10 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtY8-00000002Ze5-1EZ6
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 20:18:09 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso16446173a91.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 12:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736194687; x=1736799487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0GaMDU1JHDijDof5t0FbQDlFNQpuiTQnqh6uywyrTg=;
        b=Y2cbMzgBhwokHhu1etiEv6mpA5QGcE/hNMs0L+hIM+ZOUKfBG4SBx7O6yh33aPVBWX
         EzrSky9xI7t4Y53G8H32t/xfxq/2KbZKfhYoNcUOR67DjrFUseS1BBFjurob75M9gdLc
         K3WziIqH7BM6z3FgRp+A+692TnnzbLmbKgtkt4losk7b54tluEN9Co5+Bi7MiQO+wda6
         5SuLOIj4SzOLfqNX9CVyw1Ln9YDUCyvlYX7VHKks7nj0ASUaZAKrZ336dNWUDCjsfzWj
         WkrmPeIIhkjspZqt6VQBxVu+MszQOOn9tNkBELl+hLCkEB6Qu7U9+YcLozZywYtNGLJr
         MloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194687; x=1736799487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0GaMDU1JHDijDof5t0FbQDlFNQpuiTQnqh6uywyrTg=;
        b=wqWU2TQAhTx7/88PZ3eVpL1iBSdGlVKFLPmb4HiZn8nFqPC3x9s0Ekdqoc0DmhQeZk
         y+dbauZ09yELTWLTkeKgBOWrzS8vqIF5YnD+rQ1kffLzZ8uifrhjRiy9m3ySnbyC4X/v
         UwjW5aE93pyBXwHSFHvUnjNKX34jaablm+hrP4szOhAaB5XH+sS9z0jfI4OJaKzOhCKT
         1YOTrgKwoHvNBG6LcrNpJBwjmEWCTxbxARXhUzgOWdREyFWlPiRmHPK+RwxFazbr8Rdk
         8HuWonXUsd6NJjWUtIEbt7tQtIQ7NWYUGTlENaBQJGfqC25Jy4O33cvTrzSsMa4QU9Zf
         Ytow==
X-Forwarded-Encrypted: i=1; AJvYcCWr9YlkEl16z7b2/2omLc44hbiVJLjAWTzzT24iEBWvJakrLlIp+CQvuSvCb5yIbJhFSLnu4Xg79aCCmy1P@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2qbKhC/ndXdZVb42dA2CQKXhpFcqGaYk0TUcgTSPWMyI0ZvgY
	do9dgo745nV5cPgAn6s2cciqLFH+KM1MEo3B4Dv1KfMG63HA0qv15txoFftcMPOsyN6ZKOb6eFv
	VXq4xKWQ7yEyrhUrYHDIU5+MtASE=
X-Gm-Gg: ASbGncvMYsmEoZN+QRiFhlvgWnI8paE6BKy9U+vgUI5MhKYyaA75FdMzYnEAddEUNIR
	Q+vM+Ik/2dt0+xuRuJiWCzJZ+Z4gL4tG7i8Ps8qRF2lLgqJk21CniIBQaoJXRtmppUFOfY3U=
X-Google-Smtp-Source: AGHT+IEMGb87OFQuJfOXeyD6W2MV/LaUciQW64MBFpUBXTvmXxqYjiY4re2OdxXlItV8fNYPUYktNeEauohkfWTnwKY=
X-Received: by 2002:a17:90b:54c4:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-2f452e38d72mr89776314a91.20.1736194686711; Mon, 06 Jan 2025
 12:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
 <20250106141316.375984-3-martin.blumenstingl@googlemail.com> <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 21:17:55 +0100
X-Gm-Features: AbW1kvZ4sjlSpzNI2qfZDOfjihDRPUGNnWB5HCHlgSe6uNrrrt1gQ8zPmoQo7Nc
Message-ID: <CAFBinCDanNUqcM35gEn7yREY0egddGMCppemnxj57Wo065Rwww@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
To: Jerome Brunet <jbrunet@baylibre.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	s.nawrocki@samsung.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_121808_333369_BC87A5C8 
X-CRM114-Status: GOOD (  19.60  )
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAzOjI44oCvUE0gSmVyb21lIEJydW5ldCA8amJydW5ldEBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uIDA2IEphbiAyMDI1IGF0IDE1OjEzLCBNYXJ0
aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90
ZToKPgo+ID4gQ29kZWMgZHJpdmVyIGNhbiBpbXBsZW1lbnQgLmh3X3BhcmFtcyBhbmQvb3IgLnBy
ZXBhcmUgZnJvbSBzdHJ1Y3QKPiA+IHNuZF9zb2NfZGFpX29wcy4gRm9yIGNvZGVjLXRvLWNvZGVj
IGxpbmtzIG9ubHkgdGhlIGZvcm1lciAoLmh3X3BhcmFtcykKPiA+IGNhbGxiYWNrIGhhcyBiZWVu
IGNhbGxlZC4KPiA+Cj4gPiBPbiBwbGF0Zm9ybXMgbGlrZSBBbWxvZ2ljIE1lc29uOC84Yi84bTIg
dGhlIFNvQydzIHNvdW5kIGNhcmQKPiA+IChzb3VuZC9zb2MvbWVzb24vZ3gtY2FyZC5jKSB1c2Vz
IGEgY29kZWMtdG8tY29kZWMgbGluayBmb3IgdGhlIEhETUkKPiA+IGNvZGVjIG91dHB1dCBiZWNh
dXNlIGZ1cnRoZXIgZGlnaXRhbCByb3V0aW5nIGlzIHJlcXVpcmVkIGFmdGVyIHRoZQo+ID4gYmFj
a2VuZC4gVGhlIG5ldyBEUk0gSERNSSAoYXVkaW8pIGNvZGVjIGZyYW1ld29yayAod2hpY2ggaW50
ZXJuYWxseQo+ID4gdXNlcyBzb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYykgcmVsaWVzIG9u
IHRoZSAucHJlcGFyZSBjYWxsYmFjawo+ID4gb2YgdGhlIGhkbWktY29kZWMgdG8gYmUgY2FsbGVk
LiBJbXBsZW1lbnQgYSBjYWxsIHRvCj4gPiBzbmRfc29jX2RhaV9wcmVwYXJlKCkgc28gdGhlIC5w
cmVwYXJlIGNhbGxiYWNrIG9mIHRoZSBoZG1pLWNvZGVjIGlzCj4gPiBjYWxsZWQgb24gdGhvc2Ug
cGxhdGZvcm1zLgo+ID4KPiA+IEZvciBwbGF0Zm9ybXMgb3Igc291bmQgY2FyZHMgd2l0aG91dCBh
IGNvZGVjLXRvLWNvZGVjIGxpbmsgd2l0aAo+ID4gYWRkaXRpb25hbCBwYXJhbWV0ZXJzICh3aGlj
aCBhcHBsaWVzIHRvIG1vc3QgaGFyZHdhcmUpIHRoaXMgY2hhbmdlcwo+ID4gbm90aGluZyBhcyB0
aGUgLnByZXBhcmUgY2FsbGJhY2sgaXMgYWxyZWFkeSBjYWxsZWQgdmlhCj4gPiBzbmRfcGNtX2Rv
X3ByZXBhcmUoKSAoYXMgd2VsbCBhcyBkcGNtX2ZlX2RhaV9wcmVwYXJlKCkgYW5kCj4gPiBkcGNt
X2JlX2RhaV9wcmVwYXJlKCkpIG9uIHRob3NlLgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogSmVyb21l
IEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+Cj4gVGhh
bmtzIGZvciB3b3JraW5nIG9uIHRoaXMuIE92ZXJhbGwgaXQgbG9va3MgZ29vZC4KPgo+IE5vdCBz
dXJlIGlmIHRoZSBjYWxsIHRoZSAucHJlcGFyZSgpIHNob3VsZCBnbyBhdCB0aGUgYmVnaW5uaW5n
IG9mCj4gUE9TVF9QTVUsIGFzIGRvbmUgaGVyZSwgb3IgYXQgdGhlIGVuZCBvZiBQUkVfUE1VID8K
SSBvbmx5IGtub3cgdGhhdCAucHJlcGFyZSgpIHNob3VsZCBiZSBjYWxsZWQgbGF0ZXIgdGhhbiAu
aHdfcGFyYW1zKCkKc28gdGhpcyBpcyB3aGF0IEkgY2FtZSB1cCB3aXRoLgpNYXJrLCBkbyB5b3Ug
aGF2ZSBhbnkgcHJlZmVyZW5jZXMgb3Igc3VnZ2VzdGlvbnMgaGVyZT8KClJlZ2FyZGluZyB0aGUg
Y2FsbCB0byBzbmRfc29jX2RhaV9wcmVwYXJlKCk6IEknbGwgdGFrZSBjYXJlIG9mIHRoYXQgaW4K
djIgb25jZSB0aGUgYWJvdmUgcXVlc3Rpb24gaGFzIGJlZW4gY2xhcmlmaWVkLgoKCkJlc3QgcmVn
YXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
