Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D10606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxi9BbCa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wXISxPCUWy1RIO1fT1BrMGUsh6CjGWLkOzc4PKjgIJw=; b=kxi9BbCa9IDL/gky4hJ+s0DT+X
	s+DJsnTuJz/++TPkf8cU2RJeSzRiST4t2Zfy4bfmqoi91bGCCgMc2yuh3ost2JvHdheEH1PLYeFWD
	8RdUFrnKX0lPrZYmmehv/nqyJ0IwlE2OhS0Nf4cvtRv+c/lYCsmgEVWO4Al8apx4uX+faMAYo0SEf
	d+iY7oaFqmLzNSvuNpTOxRs0niRhPJjPoAo5rwcBvywT8z7OoRCPnAFiOAnxq6/fyDQem+OBVIuGy
	tY8gGFr87Ej6t+m9fQX10YFzBnY81z8eObfA8EohY+ee/kFE1BLSX/IklaEwj1mXRVPI4rEfHZhI+
	O3kTfCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnAi-0000000BoPv-0jDU;
	Fri, 30 Oct 2026 14:01:32 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnAf-0000000BoNr-2d1f;
	Fri, 30 Oct 2026 14:01:31 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 68C167229E5E; Fri, 30 Oct 2026 15:01:25 +0100 (CET)
Date: Fri, 30 Oct 2026 15:01:25 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <auSjNcZpaWzqY3on@desktop>
References: <20261012195213.875403-1-linkmauve@linkmauve.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012195213.875403-1-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070129_823253_9DF6E0E5 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBNb24sIE9jdCAxMiwgMjAyNiBhdCAwOTo1MjowN1BNICswMjAwLCBMaW5rIE1hdXZl
IHdyb3RlOgo+IFRoaXMgY2FsbGJhY2sgdXNlZCB0byB0YWtlIGEgbXV0YWJsZSB2b2lkICogZm9y
IG5vIHJlYXNvbiwgd2hpY2ggY2F1c2VzCj4gdGhlIGNvbXBpbGVyIHRvIGJlIHVuYXdhcmUgdGhh
dCB0aGUgdmFsIGJ1ZmZlciBzaG91bGQgbmV2ZXIgYmUgbW9kaWZpZWQKPiBieSB0aGUgY2FsbGJh
Y2suCj4gCj4gVGhpcyB3YXMgZm91bmQgd2hpbGUgZHJhZnRpbmcgdGhlIG52bWVtLXByb3ZpZGVy
IFJ1c3QgYWJzdHJhY3Rpb24uCj4gCj4gVGhhbmtzIHRvIHRoZSBndWlkYW5jZSBvZiBBbmR5IFNo
ZXZjaGVua28sIHRoaXMgbm93IGludHJvZHVjZXMgYSBuZXcKPiBjYWxsYmFjayBhbmQgZGVwcmVj
YXRlcyB0aGUgZXhpc3Rpbmcgb25lLCB3aXRoIHRoZSBnb2FsIG9mIHJlbmFtaW5nIHRoZQo+IG5l
dyBvbmUgaW50byB0aGUgb2xkIG9uZSBvbmNlIG5vIHVzZXIgcmVtYWlucyBpbiB0aGUga2VybmVs
Lgpb4oCmXQoKSG93IGNvdWxkIHdlIHByb2NlZWQgdG8gbWVyZ2UgdGhpcyBzZXJpZXMgaW4gdGlt
ZSBmb3IgNy40PyAgSeKAmWQgcmVhbGx5Cmxpa2UgdG8gZ2V0IGRvbmUgd2l0aCBpdCBhbmQgbW92
ZSBiYWNrIHRvIHRoZSBSdXN0IGFic3RyYWN0aW9ucy4KCi0tIApMaW5rIE1hdXZlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
